package com.test.hike.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.hike.dto.LocationDTO;

@Service
public class LocationService {
    
	@Autowired
    private SqlSession sqlSession;
    // 또는 
    // @Autowired
    // private LocationMapper locationMapper;

	/*
	 * public List<LocationDTO> getAllLocations() { try { return
	 * sqlSession.selectList("com.test.hike.mapper.LocationMapper.getAllLocations");
	 * // 또는 // return locationMapper.getAllLocations(); } catch(Exception e) {
	 * e.printStackTrace(); return new ArrayList<>(); } }
	 */
    
 // LocationService에 테스트 코드 추가
    public List<LocationDTO> getAllLocations() {
        try {
            List<LocationDTO> locations = sqlSession.selectList("com.test.hike.mapper.LocationMapper.getAllLocations");
            System.out.println("조회된 지역 수: " + locations.size());
            locations.forEach(loc -> System.out.println(loc.getLocationId() + ": " + loc.getName()));
            return locations;
        } catch(Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
    
}