package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;

public interface RentAreaService {
    public void deleteByBuildings(Long[] ids);
    public void addRentArea(BuildingDTO buildingDTO);
}
