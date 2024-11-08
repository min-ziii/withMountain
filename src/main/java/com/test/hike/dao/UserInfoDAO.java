package com.test.hike.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.test.hike.dto.UserInfoDTO;

@Repository
public class UserInfoDAO {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    // 회원 등록
    public int insertUser(UserInfoDTO user) {
        String sql = "INSERT INTO UserInfo "
                + "(user_id, location_id, email, password, nickname, name, "
                + "gender, birthday, intro, profile_image, create_date) "
                + "VALUES (seqUserInfo.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, default, sysdate)";
                
        try {
            return jdbcTemplate.update(sql, 
                user.getLocationId(),
                user.getEmail(),
                user.getPassword(),
                user.getNickname(),
                user.getName(),
                user.getGender(),
                user.getBirthday(),
                user.getIntro() != null ? user.getIntro() : ""
            );
        } catch (DataAccessException e) {
            if (e.getMessage().contains("unique constraint")) {
                if (e.getMessage().toLowerCase().contains("email")) {
                    throw new IllegalStateException("이미 존재하는 이메일입니다.", e);
                } else if (e.getMessage().toLowerCase().contains("nickname")) {
                    throw new IllegalStateException("이미 존재하는 닉네임입니다.", e);
                }
            }
            throw new RuntimeException("회원 등록 중 오류가 발생했습니다.", e);
        }
    }
    
    // 회원 정보 수정
    public int updateUser(UserInfoDTO user) {
        // 기존 사용자 정보 조회
        UserInfoDTO existingUser = getUserById(user.getUserId());
        if (existingUser == null) {
            throw new IllegalArgumentException("존재하지 않는 회원입니다.");
        }

        StringBuilder sql = new StringBuilder("UPDATE UserInfo SET ");
        List<Object> params = new ArrayList<>();

        // 닉네임 중복 검사 (현재 사용자의 닉네임은 제외)
        if (!existingUser.getNickname().equals(user.getNickname()) && isNicknameExists(user.getNickname())) {
            throw new IllegalArgumentException("이미 사용 중인 닉네임입니다.");
        }

        // 필수 필드 업데이트
        sql.append("location_id=?, nickname=?, name=?, gender=?, birthday=?");
        params.add(user.getLocationId());
        params.add(user.getNickname());
        params.add(user.getName());
        params.add(user.getGender());
        params.add(user.getBirthday());

        // 선택적 필드 업데이트
        if (user.getIntro() != null) {
            sql.append(", intro=?");
            params.add(user.getIntro());
        }

        // 비밀번호가 제공된 경우에만 업데이트
        if (user.getPassword() != null && !user.getPassword().isEmpty()) {
            sql.append(", password=?");
            params.add(user.getPassword());
        }

        sql.append(" WHERE user_id=?");
        params.add(user.getUserId());

        try {
            int result = jdbcTemplate.update(sql.toString(), params.toArray());
            if (result == 0) {
                throw new IllegalStateException("회원 정보 수정에 실패했습니다.");
            }
            return result;
        } catch (DataAccessException e) {
            throw new RuntimeException("회원 정보 수정 중 오류가 발생했습니다.", e);
        }
    }
    
    // 회원 삭제
    public int deleteUser(String userId) {
        String sql = "DELETE FROM UserInfo WHERE user_id = ?";
        try {
            int result = jdbcTemplate.update(sql, userId);
            if (result == 0) {
                throw new IllegalStateException("존재하지 않는 회원입니다.");
            }
            return result;
        } catch (DataAccessException e) {
            throw new RuntimeException("회원 삭제 중 오류가 발생했습니다.", e);
        }
    }
    
    // ID로 회원 조회
    public UserInfoDTO getUserById(String userId) {
        String sql = "SELECT * FROM UserInfo WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, 
                new Object[]{userId}, 
                (rs, rowNum) -> convertToUserDTO(rs));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    
    // 이메일로 회원 조회
    public UserInfoDTO getUserByEmail(String email) {
        String sql = "SELECT * FROM UserInfo WHERE email = ?";
        try {
            return jdbcTemplate.queryForObject(sql, 
                new Object[]{email}, 
                (rs, rowNum) -> convertToUserDTO(rs));
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    
    // 모든 회원 조회
    public List<UserInfoDTO> getAllUsers() {
        String sql = "SELECT * FROM UserInfo ORDER BY user_id";
        try {
            return jdbcTemplate.query(sql, (rs, rowNum) -> convertToUserDTO(rs));
        } catch (DataAccessException e) {
            throw new RuntimeException("회원 목록 조회 중 오류가 발생했습니다.", e);
        }
    }
    
    // ResultSet을 DTO로 변환
    private UserInfoDTO convertToUserDTO(ResultSet rs) throws SQLException {
        UserInfoDTO user = new UserInfoDTO();
        user.setUserId(rs.getString("user_id"));
        user.setLocationId(rs.getString("location_id"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setNickname(rs.getString("nickname"));
        user.setName(rs.getString("name"));
        user.setGender(rs.getString("gender"));
        user.setBirthday(rs.getString("birthday"));
        user.setIntro(rs.getString("intro"));
        user.setProfileImage(rs.getString("profile_image"));
        user.setCreateDate(rs.getString("create_date"));
        return user;
    }
    
    // 이메일 중복 체크
    public boolean isEmailExists(String email) {
        String sql = "SELECT COUNT(*) FROM UserInfo WHERE email = ?";
        try {
            int count = jdbcTemplate.queryForObject(sql, Integer.class, email);
            return count > 0;
        } catch (DataAccessException e) {
            throw new RuntimeException("이메일 중복 검사 중 오류가 발생했습니다.", e);
        }
    }
    
    // 닉네임 중복 체크
    public boolean isNicknameExists(String nickname) {
        String sql = "SELECT COUNT(*) FROM UserInfo WHERE nickname = ?";
        try {
            int count = jdbcTemplate.queryForObject(sql, Integer.class, nickname);
            return count > 0;
        } catch (DataAccessException e) {
            throw new RuntimeException("닉네임 중복 검사 중 오류가 발생했습니다.", e);
        }
    }
    
    // 로그인 검증
    public UserInfoDTO validateUser(String email, String password) {
        String sql = "SELECT * FROM UserInfo WHERE email = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(sql, 
                new Object[]{email, password}, 
                (rs, rowNum) -> convertToUserDTO(rs));
        } catch (EmptyResultDataAccessException e) {
            return null;
        } catch (DataAccessException e) {
            throw new RuntimeException("로그인 검증 중 오류가 발생했습니다.", e);
        }
    }
}