package com.test.hike.dao;

import com.test.hike.dto.ClubDTO;
import com.test.hike.dto.ClubGalleryDTO;
import com.test.hike.mapper.ClubMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ClubDAO {

    private final ClubMapper mapper;

    public List<ClubDTO> clubList() {

        return mapper.clubList();

    }

    public ClubDTO clubView(String clubId) {

        return mapper.clubView(clubId);
    }

    public ClubDTO clubScheduler(String clubId) {

        return mapper.clubScheduler(clubId);
    }


    public ClubDTO clubHike(String clubId) {

        return mapper.clubHike(clubId);
    }

    public ClubDTO clubGallery(String clubId) {

        return mapper.clubGallery(clubId);
    }


    public List<ClubGalleryDTO> galleryList(String clubId) {

        return mapper.galleryList(clubId);

    }

    public int clubGalleryAdd (ClubGalleryDTO clubGalleryDTO) {

        return mapper.clubGalleryAdd(clubGalleryDTO);
    }

    public int clubAdd(ClubDTO dto) {

        return mapper.clubAdd(dto);
    }
    
}
