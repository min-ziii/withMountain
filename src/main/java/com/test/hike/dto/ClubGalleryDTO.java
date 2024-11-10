package com.test.hike.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ClubGalleryDTO {
	private String clubGalleryId;
	private String clubId;
	private String scheduleId;
	private String galleryDate;
	private String galleryImage;
}
