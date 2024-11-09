package com.test.hike.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.test.hike.dto.UserInfoDTO;

@Repository
public class UserInfoDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.test.hike.mapper.UserMapper.";
    
    // 로그인 확인
    public UserInfoDTO loginCheck(String email, String password) {
        try {
            UserInfoDTO params = new UserInfoDTO();
            params.setEmail(email);
            params.setPassword(password);
            return sqlSession.selectOne(NAMESPACE + "loginCheck", params);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // 회원가입
    public int insertUser(UserInfoDTO user) {
        try {
            return sqlSession.insert(NAMESPACE + "insertUser", user);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    // 이메일 중복 체크
    public int isEmailExists(String email) {
        try {
            return sqlSession.selectOne(NAMESPACE + "isEmailExists", email);
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // 예외 발생 시 0 반환 (중복 아님)
        }
    }
    
    // 프로필 이미지 업데이트
    public int updateProfileImage(UserInfoDTO user) {
        try {
            return sqlSession.update(NAMESPACE + "updateProfileImage", user);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}