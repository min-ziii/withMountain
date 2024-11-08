package com.test.hike.dto;

import lombok.Data;

@Data
public class ScheduleDTO {
	private int scheduleId;
	private int clubId;
	private int userId;
	private int courseId;
	private String title;
	private String hikeDate;
	private String contents;
}
