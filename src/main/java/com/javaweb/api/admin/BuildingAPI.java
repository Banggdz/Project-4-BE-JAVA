package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.domain.Pageable;   // ✅ đúng

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")

public class BuildingAPI {

    @Autowired
    private BuildingService buildingService;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @GetMapping public List<BuildingSearchResponse> getBuilding(@ModelAttribute BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingSearchResponse> res = buildingService.findAll(buildingSearchRequest,pageable);
        return res;
    }
    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable Long[] ids) {
        buildingService.deleteBuildings(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO LoadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }

    @PostMapping
    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        return ResponseEntity.ok(buildingService.addOrUpdateBuilding(buildingDTO));
    }


    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.addAssignmentBuildingEntity(assignmentBuildingDTO);
    }
}
