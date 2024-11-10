package com.test.hike.mapper;
import com.test.hike.dto.UserInfoDTO;

public interface UserMapper {
    
    // 로그인 체크
    UserInfoDTO loginCheck(UserInfoDTO params);
    

    // 회원가입
    int insertUser(UserInfoDTO user);
    

    int insertToken(UserTokenDTO token);

    int getSeqUserInfo();

    // 이메일 중복 체크
    int checkEmailExists(String email);
    
    // 프로필 이미지 업데이트
    int updateProfileImage(UserInfoDTO params);
}