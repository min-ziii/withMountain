package com.test.hike.dto;

import lombok.Data;

@Data
public class ClubGalleryDTO {
	private int clubGalleryId;
	private int clubId;
	private int scheduleId;
	private String galleryDate;
	private String image;
}
