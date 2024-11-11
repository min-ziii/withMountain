package com.test.hike.mapper;

import com.test.hike.dto.ClubDTO;
import com.test.hike.dto.ClubGalleryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubMapper {

	List<ClubDTO> clubList();

	ClubDTO clubView(String clubId);

//	List<MemberDTO> clubViewMember(String clubId);

	ClubDTO clubScheduler(String clubId);

	ClubDTO clubHike(String clubId);

	ClubDTO clubGallery(String clubId);

	List<ClubGalleryDTO> galleryList(String clubId);

	int clubGalleryAdd(ClubGalleryDTO clubGalleryDTO);

	int clubAdd(ClubDTO dto);
}

