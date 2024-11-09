package com.test.hike.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.test.hike.dao.UserInfoDAO;
import com.test.hike.dto.LocationDTO;
import com.test.hike.dto.UserInfoDTO;
import com.test.hike.service.LocationService;

@Controller
@RequestMapping("/hike")  // 기본 경로 추가
public class UserController {
	
    @Autowired
    private UserInfoDAO userDAO;
    
    @Autowired
    private LocationService locationService;
    
    
    @GetMapping("/getLocations")
    @ResponseBody
    @CrossOrigin
    public List<LocationDTO> getLocations() {
        return locationService.getAllLocations();
    }
    
    // GET mapping도 .do로 변경
    @GetMapping("/login.do")
    public String loginPage(
        @RequestParam(value = "error", required = false) String error,
        Model model
    ) {
        if (error != null) {
            model.addAttribute("loginError", "이메일 또는 비밀번호가 올바르지 않습니다.");
        }
        return "redirect:/";
    }

    @PostMapping("/login.do")  // /login에서 /login.do로 변경
    @ResponseBody
    public Map<String, Object> login(
        @RequestParam String email, 
        @RequestParam String password,
        HttpSession session
    ) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            System.out.println("POST 로그인 시도 - 이메일: " + email);
            UserInfoDTO user = userDAO.loginCheck(email, password);
            
            if(user != null) {
                session.setAttribute("loginMember", user);
                response.put("success", true);
                System.out.println("로그인 성공");
            } else {
                response.put("success", false);
                response.put("message", "이메일 또는 비밀번호가 일치하지 않습니다.");
                System.out.println("로그인 실패 - 사용자 정보 없음");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("로그인 처리 중 에러: " + e.getMessage());
            response.put("success", false);
            response.put("message", "로그인 처리 중 오류가 발생했습니다.");
        }
        
        return response;
    }
    


    // 회원가입 처리
    @PostMapping("/signup")
    @ResponseBody
    public Map<String, Object> signup(@ModelAttribute UserInfoDTO user,
                                    @RequestParam(required = false) MultipartFile profileImage,
                                    @RequestParam Long locationId,
                                    HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        Map<String, String> errors = new HashMap<>();

        // 유효성 검사 - int 반환값을 boolean 조건으로 변환
        if(userDAO.isEmailExists(user.getEmail()) > 0) {  // 0보다 크면 이메일이 존재
            errors.put("email", "이미 사용중인 이메일입니다.");
        }
        
        if (locationId == null || locationId < 1) {
            errors.put("locationId", "활동 지역을 선택해주세요.");
        }
        
        // 프로필 이미지 처리
        if(profileImage != null && !profileImage.isEmpty()) {
            // 회원가입 시 이미지 저장
            String savedFileName = saveFile(profileImage, request);
            if(savedFileName != null) {
                user.setProfileImage("/resources/static/images/profile/" + savedFileName);
            } else {
                errors.put("profileImage", "프로필 이미지 저장에 실패했습니다.");
            }
        } else {
            // 기본 프로필 이미지 설정
            user.setProfileImage("/resources/static/images/default-profile.svg");
        }
        
        if(errors.isEmpty()) {
            try {
                user.setLocationId(String.valueOf(locationId));
                userDAO.insertUser(user);
                response.put("success", true);
                response.put("message", "회원가입이 완료되었습니다.");
            } catch(Exception e) {
                response.put("success", false);
                response.put("message", "회원가입 처리 중 오류가 발생했습니다.");
            }
        } else {
            response.put("success", false);
            response.put("errors", errors);
        }

        return response;
    }

    // 이메일 중복 확인
    @PostMapping("/checkEmail")
    @ResponseBody
    public Map<String, Object> checkEmail(@RequestParam String email) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            int count = userDAO.isEmailExists(email);  // int로 받고
            boolean exists = count > 0;  // boolean으로 변환
            
            response.put("exists", exists);
            response.put("success", true);
            
            if (exists) {
                response.put("message", "이미 사용중인 이메일입니다.");
            } else {
                response.put("message", "사용 가능한 이메일입니다.");
            }
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "이메일 확인 중 오류가 발생했습니다.");
        }
        
        return response;
    }
    
    
    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // 기존의 여러 saveFile 메서드들을 하나로 통합
    private String saveFile(MultipartFile file, HttpServletRequest request) {
        try {
            // 이미지가 저장될 실제 경로
            String realPath = request.getServletContext().getRealPath("/resources/static/images/profile");
            
            // 디렉토리 생성
            File dir = new File(realPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // 파일명 생성 (UUID + 확장자)
            String originalFileName = file.getOriginalFilename();
            String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            String savedFileName = UUID.randomUUID().toString() + extension;
            
            // 파일 저장
            File savedFile = new File(dir, savedFileName);
            file.transferTo(savedFile);
            
            // 저장된 파일의 경로 반환
            return savedFileName;
            
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    // 프로필 이미지 업데이트 (로그인 상태에서만 호출)
    @PostMapping("/updateProfile")
    @ResponseBody
    public Map<String, Object> updateProfile(
            @RequestParam("profileImage") MultipartFile profileImage,
            HttpServletRequest request,
            HttpSession session) {
        
        Map<String, Object> response = new HashMap<>();
        
        try {
            UserInfoDTO loginMember = (UserInfoDTO) session.getAttribute("loginMember");
            
            if (loginMember != null) {
                String savedFileName = saveFile(profileImage, request);
                if (savedFileName != null) {
                    String imagePath = "/resources/static/images/profile/" + savedFileName;
                    
                    // DB에 새 이미지 경로 업데이트
                    loginMember.setProfileImage(imagePath);
                    userDAO.updateProfileImage(loginMember);
                    
                    // 세션 업데이트
                    session.setAttribute("loginMember", loginMember);
                    
                    response.put("success", true);
                    response.put("newImageUrl", imagePath);
                } else {
                    response.put("success", false);
                    response.put("message", "이미지 저장에 실패했습니다.");
                }
            } else {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("message", "프로필 이미지 업데이트 중 오류가 발생했습니다.");
        }
        
        return response;
    }

     
    
}