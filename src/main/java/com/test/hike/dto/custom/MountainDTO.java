package com.test.hike.dto.custom;

import lombok.Data;

import java.util.List;

@Data
public class MountainDTO {
	private String mtId;
    private String mtName;
    private String mtAddress;
    private double mtX;
    private double mtY;
    private List<RoadDTO> roadList;
}