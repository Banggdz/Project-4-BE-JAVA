package com.javaweb.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "assignmentbuilding")
public class AssignmentBuildingEntity extends BaseEntity {

    @ManyToOne
    @JoinColumn(name = "staffid")
    private UserEntity userEntity;

    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity building;

    // Constructor mặc định (JPA yêu cầu)
    public AssignmentBuildingEntity() {}

    // Constructor custom
    public AssignmentBuildingEntity(UserEntity userEntity, BuildingEntity building) {
        this.userEntity = userEntity;
        this.building = building;
    }

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public BuildingEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingEntity buildingEntity) {
        this.building = buildingEntity;
    }
}
