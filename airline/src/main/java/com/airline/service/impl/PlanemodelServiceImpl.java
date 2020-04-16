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
	public String insertPlanemodel(Planemodel planemodel) {
		// TODO Auto-generated method stub
		Planemodel p = planemodelRepository.queryPlanemodelOne(planemodel.getPlanemodelName());
		String res=null;
		if(p==null) {
			if(planemodel.getPlanemodelName().isEmpty()) {
				res = "机型不能为空";
			}else {
				int i = planemodelRepository.insertPlanemodel(planemodel);
				res = i==1?"添加成功":"添加失败";
			}
		}else{
			res = "该机型已添加";
		}
		return res;
	}

	@Override
	public String updatePlanemodel(Planemodel planemodel) {
		// TODO Auto-generated method stub
		int i = planemodelRepository.updatePlanemodel(planemodel);
		String res = i==1?"修改成功":"修改失败";
		return res;
	}

	@Override
	public int deletePlanemodel(Planemodel planemodel) {
		// TODO Auto-generated method stub
		return planemodelRepository.deletePlanemodel(planemodel);
	}
}
