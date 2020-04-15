package com.airline.service;

import java.util.List;

import com.airline.domain.Planemodel;

public interface PlanemodelService {
	List<Planemodel> queryPlanemodel();
	Planemodel queryPlanemodelOne(String planemodelName);
	int insertPlanemodel(Planemodel planemodel);
	int updatePlanemodel(Planemodel planemodel);
	int deletePlanemodel(Planemodel planemodel);
}
