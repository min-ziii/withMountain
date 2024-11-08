package com.test.hike.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpSession;
import java.io.File;

import com.test.hike.dao.UserInfoDAO;
import com.test.hike.dto.UserInfoDTO;

@Controller
public class AuthController {

    @Autowired
    private UserInfoDAO userInfoDAO;

    // 로그인 처리
    @PostMapping("/login")
    @ResponseBody
    public String login(@RequestParam String email, 
                       @RequestParam String password,
                       HttpSession session) {
        try {
            UserInfoDTO user = userInfoDAO.validateUser(email, password);
            if (user != null) {
                // 세션에 로그인 정보 저장
                session.setAttribute("loginMember", user);
                return "success";
            } else {
                return "이메일 또는 비밀번호가 일치하지 않습니다.";
            }
        } catch (Exception e) {
            return "로그인 처리 중 오류가 발생했습니다.";
        }
    }

    // 회원가입 처리
    @PostMapping("/signup")
    @ResponseBody
    public String signup(@ModelAttribute UserInfoDTO user,
                        @RequestParam(required = false) MultipartFile profileImage) {
        try {
            // 프로필 이미지 처리
            if (profileImage != null && !profileImage.isEmpty()) {
                String fileName = handleFileUpload(profileImage);
                user.setProfileImage(fileName);
            }

            // 회원 등록
            userInfoDAO.insertUser(user);
            return "success";
            
        } catch (IllegalStateException e) {
            return e.getMessage(); // 이미 존재하는 이메일/닉네임 에러
        } catch (Exception e) {
            return "회원가입 처리 중 오류가 발생했습니다.";
        }
    }

    // 로그아웃 처리
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }

    // 이메일 중복 체크
    @GetMapping("/check-email")
    @ResponseBody
    public boolean checkEmail(@RequestParam String email) {
        return userInfoDAO.isEmailExists(email);
    }

    // 닉네임 중복 체크
    @GetMapping("/check-nickname")
    @ResponseBody
    public boolean checkNickname(@RequestParam String nickname) {
        return userInfoDAO.isNicknameExists(nickname);
    }

    // 프로필 이미지 업로드 처리
    private String handleFileUpload(MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            return null;
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        String uploadPath = "C:/upload/profile/"; // 서버 환경에 맞게 경로 수정 필요
        
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        File destFile = new File(uploadPath + fileName);
        file.transferTo(destFile);

        return fileName;
    }
}