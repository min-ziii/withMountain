package com.test.hike.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.hike.dto.LocationDTO;

@Repository
public class LocationDAO {
    
    @Autowired
    private SqlSession sqlSession;
    
    private static final String NAMESPACE = "com.test.hike.mapper.LocationMapper.";
    
    public List<LocationDTO> getAllLocations() {
        try {
            return sqlSession.selectList(NAMESPACE + "getAllLocations");
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}