package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.BuildingSearchBuilderConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import com.javaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaService rentAreaService;

    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @Autowired
    private BuildingSearchBuilderConverter buildingSearchBuilderConverter;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
//       List<UserEntity> staffAsignment = buildingEntity.getUserEntities();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = buildingEntity.getAssignmentBuildings()
                .stream()
                .map(AssignmentBuildingEntity::getUserEntity)
                .collect(Collectors.toList());

        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderConverter.toBuildingSearchBuilder(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchBuilder, pageable);
        List<BuildingSearchResponse> res = new ArrayList<>();
        for(BuildingEntity item : buildingEntities){
            BuildingSearchResponse building = buildingConverter.toBuildingSearchResponse(item);
            res.add(building);
        }
        System.out.println("Page size nhận được = " + pageable.getPageSize());
        return res;
    }

    @Override
    public void deleteBuildings(Long[] ids) {
        rentAreaService.deleteByBuildings(ids);
        assignmentBuildingService.deleteByBuildings(ids);
        for(Long id : ids){
            buildingRepository.deleteById(id);
        }
    }

    @Override
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO) {
        Long BuildingId = buildingDTO.getId();
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setTypeCode(String.join(",",buildingDTO.getTypeCode()));
        buildingRepository.save(buildingEntity);
        if(StringUtils.check(buildingDTO.getRentArea())) rentAreaService.addRentArea(buildingDTO);
        return buildingDTO;
    }

    @Override
    public BuildingDTO findById(Long id) {
        return null;
    }

    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        return 0;
    }

    public List<BuildingDTO> getAllBuilding(){
        List<BuildingEntity> buildingEntities = buildingRepository.findAll();
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        for(BuildingEntity buildingEntity : buildingEntities){
            BuildingDTO buildingDTO = buildingConverter.convertToDto(buildingEntity);
            buildingDTOS.add(buildingDTO);
        }
        return buildingDTOS;
    }
}