package com.test.hike.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.hike.dto.UserInfoDTO;
import com.test.hike.dto.UserTokenDTO;

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
    /*
     * public int insertUser(UserInfoDTO user) { try { return
     * sqlSession.insert(NAMESPACE + "insertUser", user); } catch (Exception e) {
     * e.printStackTrace(); return 0; } }
     */

    public String insertUser(UserInfoDTO userInfoDTO) {
        sqlSession.insert(NAMESPACE + "insertUser", userInfoDTO);
        return userInfoDTO.getUserId();
    }

    public int insertToken(UserTokenDTO userTokenDTO) {
        return sqlSession.insert(NAMESPACE + "insertToken", userTokenDTO);
    }

    public int getSeqUserInfo() {
       return sqlSession.selectOne(NAMESPACE + "getCurrentSeqUserInfo");
    }

    // 이메일 중복 체크
    public int checkEmailExists(String email) {  // 메서드명 변경
        return sqlSession.selectOne("com.test.hike.mapper.UserMapper.checkEmailExists", email);
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
    
    /* 사용자 정보 업데이트 */
    public int updateUserInfo(UserInfoDTO user) {
        try {
            return sqlSession.update(NAMESPACE + "updateUserInfo", user);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    
    /* 사용자 정보 조회 */
    public UserInfoDTO loadUser(String username) {
        try {
            return sqlSession.selectOne(NAMESPACE + "loadUser", username);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    
    
}