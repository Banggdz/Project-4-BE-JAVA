package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AssignmentBuildingImpl implements AssignmentBuildingService{

    @Autowired
    BuildingRepository buildingRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public void deleteByBuildings(Long[] ids) {
        for(Long id:ids){
            BuildingEntity  buildingEntity = buildingRepository.findById(id).get();
            assignmentBuildingRepository.deleteByBuilding(buildingEntity);
        }
    }

    @Override
    public void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<Long> staffs =  assignmentBuildingDTO.getStaffs();
        for(Long staffId:staffs){
            AssignmentBuildingEntity  assignmentBuildingEntity = new AssignmentBuildingEntity();
            assignmentBuildingEntity.setBuilding(buildingEntity);
            assignmentBuildingEntity.setUserEntity(userRepository.findById(staffId).get());
            assignmentBuildingRepository.save(assignmentBuildingEntity);
        }

    }
}
