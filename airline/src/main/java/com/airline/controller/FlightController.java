package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Company;
import com.airline.domain.Flight;
import com.airline.domain.Planemodel;
import com.airline.service.FlightService;
import com.airline.service.PlanemodelService;
import com.airline.service.impl.CompanyServiceImpl;

import net.sf.json.JSONObject;

@RestController
public class FlightController {
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	@Autowired
	private PlanemodelService planemodelService;
	@Autowired
	private FlightService flightService;
	@RequestMapping("queryCompanyPlanemodel")
	public ModelAndView queryCompanyPlanemodel() {
		ModelAndView mv = new ModelAndView("background/addflight");
		List<Company> CompanyList = companyServiceImpl.queryCompanys();
		List<Planemodel> PlanemodelList = planemodelService.queryPlanemodel();
		mv.addObject("companyList", CompanyList);
		mv.addObject("planemodelList", PlanemodelList);
		return mv;
	}
	@RequestMapping("insertFlight")
	public JSONObject insertFlight(Flight flight) {
		Map<String, String> map = new HashMap<String, String>();
		String res = flightService.insertFlight(flight);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
