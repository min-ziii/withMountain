package com.test.hike.dto;

import lombok.Data;

@Data
public class HikingRoadDTO {
	private int coordId;
	private int mtId;
	private int roadId;
	private double roadKm;
	private String roadLevel;
	private int roadTimeUp;
	private int roadTimeDown;
	private int roadSeq;
	private double roadX;
	private double roadY;
}
