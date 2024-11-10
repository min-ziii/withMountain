package com.test.hike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.hike.mapper.UserMapper;

@Service
public class UserService {
    
    @Autowired
    private UserMapper userMapper;
    
    public boolean checkEmailExists(String email) {
        return userMapper.checkEmailExists(email) == 1;  // 1이면 true(존재), 0이면 false(없음)
    }
}
