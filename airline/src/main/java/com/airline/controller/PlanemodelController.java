package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Planemodel;
import com.airline.service.PlanemodelService;
import net.sf.json.JSONObject;
@RestController
public class PlanemodelController {
	@Autowired
	private PlanemodelService planemodelService;
	@RequestMapping(value = "/insertPlanemodel", method = RequestMethod.POST)
	public JSONObject insertPlanemodel(Planemodel planemodel){
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
	@RequestMapping("/queryPlanemodel")
	public ModelAndView queryPlanemodel(){
		ModelAndView mv = new ModelAndView();
		List<Planemodel> list = planemodelService.queryPlanemodel();
		mv.addObject("planemodelList", list);
		mv.setViewName("background/updateplanemodel");
		return mv;
	}
	@RequestMapping(value = "/updatePlanemodel",method = RequestMethod.POST)
	public JSONObject updatePlanemodel(Planemodel planemodel){
		System.out.println(planemodel);
		Map<String,String> map=new HashMap<String, String>();
		String res=null;
		int i = planemodelService.updatePlanemodel(planemodel);
		res = i==1?"修改成功":"修改失败";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	@RequestMapping("/queryList")
	public ModelAndView queryList(){
		ModelAndView mv = new ModelAndView("background/findplanemodel");
		List<Planemodel> list = planemodelService.queryPlanemodel();
		mv.addObject("planemodelList", list);
		return mv;
	}
	@RequestMapping("/deletePlanemodel")
	public ModelAndView deletePlanemodel(Planemodel planemodel){
		ModelAndView mv = new ModelAndView("forward:queryList");
		planemodelService.deletePlanemodel(planemodel);
		return mv;
	}
}
