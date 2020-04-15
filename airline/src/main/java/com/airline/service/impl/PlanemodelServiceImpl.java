package com.airline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Planemodel;
import com.airline.repository.PlanemodelRepository;
import com.airline.service.PlanemodelService;
@Service
public class PlanemodelServiceImpl implements PlanemodelService{
	@Autowired
	private PlanemodelRepository planemodelRepository;
	@Override
	public List<Planemodel> queryPlanemodel() {
		// TODO Auto-generated method stub
		return planemodelRepository.queryPlanemodel();
	}

	@Override
	public Planemodel queryPlanemodelOne(String planemodelName) {
		// TODO Auto-generated method stub
		return planemodelRepository.queryPlanemodelOne(planemodelName);
	}

	@Override
	public int insertPlanemodel(Planemodel planemodel) {
		// TODO Auto-generated method stub
		return planemodelRepository.insertPlanemodel(planemodel);
	}

	@Override
	public int updatePlanemodel(Planemodel planemodel) {
		// TODO Auto-generated method stub
		return planemodelRepository.updatePlanemodel(planemodel);
	}

	@Override
	public int deletePlanemodel(Planemodel planemodel) {
		// TODO Auto-generated method stub
		return planemodelRepository.deletePlanemodel(planemodel);
	}
}
