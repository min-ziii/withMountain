package com.test.hike.mapper;

import java.util.List;
import com.test.hike.dto.LocationDTO;

public interface LocationMapper {
    List<LocationDTO> getAllLocations();
}