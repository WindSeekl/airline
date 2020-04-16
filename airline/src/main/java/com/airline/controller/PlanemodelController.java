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
		Map<String,String> map=new HashMap<String, String>();
		String res = planemodelService.insertPlanemodel(planemodel);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	@RequestMapping("/queryPlanemodel")
	public ModelAndView queryPlanemodel(){
		ModelAndView mv = new ModelAndView("background/updateplanemodel");
		List<Planemodel> list = planemodelService.queryPlanemodel();
		mv.addObject("planemodelList", list);
		return mv;
	}
	@RequestMapping(value = "/updatePlanemodel",method = RequestMethod.POST)
	public JSONObject updatePlanemodel(Planemodel planemodel){
		Map<String,String> map=new HashMap<String, String>();
		String res = planemodelService.updatePlanemodel(planemodel);
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
