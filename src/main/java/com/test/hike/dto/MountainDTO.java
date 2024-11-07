package com.test.hike.dto;

import lombok.Data;

@Data
public class MountainDTO {
	private String mtId;
    private String mtName;
    private String mtAddress;
    private double mtX;
    private double mtY;
}