package com.test.hike.dto;

import lombok.Data;

@Data
public class HikingRoadSpotDTO {
	
	private int spot_id;     	// 등산로지점순번 -> (PK)
    private String mt_id;   	// 산코드
    private String spot_type;  	// 시종점 or 분기점
    private String mt_name;  	// 산이름
    private double spot_x;      // 등산로지점 X좌표
    private double spot_y;      // 등산로지점 Y좌표
}