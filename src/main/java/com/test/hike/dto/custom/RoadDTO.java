package com.test.hike.dto.custom;

import lombok.Data;

import java.util.List;

@Data
public class RoadDTO {
	private int roadId;
    private double roadKm;
    private String roadLevel;
    private int roadTimeUp;
    private int roadTimeDown;
    private List<CoordDTO> coordList;
}