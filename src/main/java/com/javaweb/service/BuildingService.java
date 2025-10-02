package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import jdk.nashorn.internal.ir.Assignment;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    ResponseDTO listStaffs(Long BuildingId);
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    public void deleteBuildings(Long[] ids);
    public AssignmentBuildingDTO addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO);
//   người dùng gửi dữ liệu lên server, dùng DTO (request DTO) để nhận dữ liệu.
    public BuildingDTO addOrUpdateBuilding(BuildingDTO buildingDTO);
    public BuildingDTO findById(Long id);
    public int countTotalItem(List<BuildingSearchResponse> list);
}
