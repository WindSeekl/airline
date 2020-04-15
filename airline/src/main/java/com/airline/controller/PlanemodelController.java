package com.airline.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.airline.domain.Planemodel;
import com.airline.service.PlanemodelService;
import net.sf.json.JSONObject;
@RestController
public class PlanemodelController {
	@Autowired
	private PlanemodelService planemodelService;
	@RequestMapping(value = "/insertPlanemodel", method = RequestMethod.POST)
	public  JSONObject insertPlanemodel(Planemodel planemodel){
		System.out.println(planemodel);
		Planemodel p = planemodelService.queryPlanemodelOne(planemodel.getPlanemodelName());
		Map<String,String> map=new HashMap<String, String>();
		String res=null;
		if(p==null) {
			if(planemodel.getPlanemodelName().isEmpty()) {
				res = "机型不能为空";
			}else {
				int i = planemodelService.insertPlanemodel(planemodel);
				res = i==1?"添加成功":"添加失败";
			}
		}else{
			res = "该机型已添加";
		}
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
