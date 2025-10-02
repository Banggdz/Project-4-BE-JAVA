package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {
    public RentAreaEntity toRentAreaEntity(BuildingDTO buildingDTO,Long val) {
        BuildingEntity buildingEntity = new BuildingEntity();
        buildingEntity.setId(buildingDTO.getId());
        RentAreaEntity res = new RentAreaEntity();
        res.setValue(val);
        res.setBuilding(buildingEntity);
        return res;
    }
    public RentAreaEntity toRentAreaEntity(Long val,BuildingEntity buildingEntity) {
        RentAreaEntity res = new RentAreaEntity();
        res.setValue(val);
        res.setBuilding(buildingEntity);
        return res;
    }
    public List<RentAreaEntity> toRentAreaEntityList(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String[] rentAreas = buildingDTO.getRentArea().split(",");
        List<RentAreaEntity> res = new ArrayList<>();
        for (String val : rentAreas) {
            res.add(toRentAreaEntity(Long.parseLong(val), buildingEntity));
        }
        return res;
    }
}
