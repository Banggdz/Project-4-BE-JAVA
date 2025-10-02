package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.DistrictCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaConverter rentAreaConverter;
    public BuildingEntity convertToEntity (BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setTypeCode(String.join(",", buildingDTO.getTypeCode()));
        buildingEntity.setRentAreaEntities(rentAreaConverter.toRentAreaEntityList(buildingDTO,buildingEntity));
        return buildingEntity;
    }

    public BuildingDTO convertToDto(BuildingEntity entity){
        BuildingDTO result = modelMapper.map(entity,BuildingDTO.class);
        return result;
    }

    public BuildingSearchResponse toBuildingSearchResponse (BuildingEntity item){
        BuildingSearchResponse res = modelMapper.map(item, BuildingSearchResponse.class);
        Map<String,String> districts = DistrictCode.type();
        String district = item.getDistrict();
        if(district != null){
            res.setAddress(item.getStreet()+", "+item.getWard()+", "+districts.get(district));
        }
        List<RentAreaEntity> rentAreaEntities = item.getRentAreaEntities();
        String areaResult = rentAreaEntities.stream().map(it->String.valueOf(it.getValue())).collect(Collectors.joining(", "));
        res.setRentArea(areaResult);
        return res;
    }
}
