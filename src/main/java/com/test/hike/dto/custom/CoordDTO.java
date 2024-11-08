package com.test.hike.dto.custom;

import lombok.Data;

@Data
public class CoordDTO {
	private int coordId;
    private int roadSeq;
    private double roadX;
    private double roadY;
}