package com.test.hike.dto;

import lombok.Data;

@Data
public class CourseDTO {
	private int courseId;
	private int mtId;
	private int userId;
	private String title;
	private String type;
}
