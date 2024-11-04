package com.test.hike.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MapAPISpotDTO {
	
	private int seq;
	private int spot_num;
	private String mt_code;
	private String spot_name;
	private String mt_name;
	private int geo_x;
	private int geo_y;
}
