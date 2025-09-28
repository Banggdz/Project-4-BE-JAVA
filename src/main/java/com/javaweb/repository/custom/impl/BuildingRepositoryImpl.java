package com.javaweb.repository.custom.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustomer;
import com.javaweb.utils.NumberUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustomer {

    @PersistenceContext
    private EntityManager entityManager;

    public void joinTable(BuildingSearchBuilder buildingSearchBuilder,StringBuilder sql){
        Long staffId = buildingSearchBuilder.getStaffId();
        if(staffId != null){
            sql.append(" INNER JOIN assignmentbuilding ab ON ab.buildingid = b.id");
        }
    }

    public void queryNormal(BuildingSearchBuilder buildingSearchBuilder,StringBuilder where){
        try{
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field item:fields){
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffid")&&!fieldName.startsWith("rentPrice")&&!fieldName.startsWith("area")&&!fieldName.equals("typeCode")){
                    Object value = item.get(buildingSearchBuilder);
                    if(value != null){
                        if(item.getType().getName().equals("java.lang.String")){
                            where.append(" AND b."+fieldName+" LIKE '%"+value+"%' ");
                        }
                        else where.append(" AND b."+fieldName+" = "+value+" ");
                    }

                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
    public void querySpecial(BuildingSearchBuilder buildingSearchBuilder,StringBuilder where){
        Long staffId =  buildingSearchBuilder.getStaffId();
        if(staffId != null){
            where.append(" AND ab.staffid="+staffId);
        }
        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();
        if(rentAreaFrom != null || rentAreaTo != null){
            where.append(" AND EXISTS (SELECT * FROM rentarea r WHERE r.buildingid = b.id ");
            if(rentAreaFrom != null){
                where.append(" AND r.value>="+rentAreaFrom+" ");
            }
            if(rentAreaTo != null){
                where.append(" AND r.value<="+rentAreaTo+" ");
            }
            where.append(") ");
        }
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        if(rentPriceFrom != null || rentPriceTo != null){
            if(rentPriceFrom != null){
                where.append(" AND b.rentprice>="+rentPriceFrom+" ");
            }
            if(rentPriceTo != null){
                where.append(" AND b.rentprice<="+rentPriceTo+" ");
            }
        }
        List<String> typeCode = buildingSearchBuilder.getTypeCode();

        if(typeCode != null&&typeCode.size()>0){
            List<String> code = new ArrayList<>();
            for(String s:typeCode){
                code.add("'"+s+"'");
            }
            where.append(" AND b.type IN ("+String.join(",",code)+") ");
        }
    }
    public void groupByQuery(BuildingSearchBuilder buildingSearchBuilder,StringBuilder where){
        where.append(" GROUP BY b.id ");
        if(buildingSearchBuilder.getStaffId() != null){
            where.append(" , assignmentbuilding.id  ");
        }
    }


    @Override
    public int countTotalItem(List<BuildingSearchResponse> list) {
        return 0;
    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(buildingSearchBuilder,sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(buildingSearchBuilder,where);
        querySpecial(buildingSearchBuilder,where);
        groupByQuery(buildingSearchBuilder,where);
        sql.append(where);
        System.out.println(sql);
        Query query = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        return query.getResultList();
    }
}
