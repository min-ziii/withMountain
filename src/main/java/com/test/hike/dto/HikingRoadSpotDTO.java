package com.test.hike.dto;

import lombok.Data;

@Data
public class HikingRoadSpotDTO {
	
	private int spotId;     	// 등산로지점순번 -> (PK)
    private String mtId;   	    // 산코드
    private String spotType;  	// 시종점 or 분기점
    private double spotX;      // 등산로지점 X좌표
    private double spotY;      // 등산로지점 Y좌표
}