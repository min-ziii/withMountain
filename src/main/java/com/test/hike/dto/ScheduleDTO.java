package com.test.hike.dto;

import lombok.Data;

@Data
public class ScheduleDTO {
	private String scheduleId;
	private String clubId;
	private String userId;
	private String courseId;
	private String title;
	private String hikeDate;
	private String contents;
}
