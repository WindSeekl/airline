package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Planemodel;
@Mapper
public interface PlanemodelRepository {
	List<Planemodel> queryPlanemodel();
	Planemodel queryPlanemodelOne(String planemodelName);
	int insertPlanemodel(Planemodel planemodel);
	int updatePlanemodel(Planemodel planemodel);
}
