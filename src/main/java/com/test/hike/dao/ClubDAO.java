package com.test.hike.dao;

import com.test.hike.dto.ClubDTO;
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

    public ClubDTO clubView(String club_id) {

        return mapper.clubView(club_id);
    }


    public ClubDTO clubScheduler(String club_id) {

        return mapper.clubScheduler(club_id);
    }

}
