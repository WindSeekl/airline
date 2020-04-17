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
import com.airline.service.CnamePnameService;
import com.airline.service.FlightService;
import com.airline.service.impl.CompanyServiceImpl;

import net.sf.json.JSONObject;

@RestController
public class FlightController {
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	@Autowired
	private FlightService flightService;
	@Autowired
	private CnamePnameService cnamePnameService;
	@RequestMapping("queryCompanyPlanemodel")
	public ModelAndView queryFlight() {
		ModelAndView mv = new ModelAndView("background/addflight");
		List<Company> CompanyList = companyServiceImpl.queryCompanys();
		mv.addObject("companyList", CompanyList);
		return mv;
	}
	@RequestMapping("queryCompanyByPlanemodel")
	public ModelAndView queryCompanyByPlanemodel(String companyName) {
		ModelAndView mv = new ModelAndView("background/addflight");
		List<Company> CompanyList = companyServiceImpl.queryCompanys();
		List<String> list=cnamePnameService.queryCnamePname(companyName);
		List<Planemodel> pnameList=cnamePnameService.queryPname(list);
		mv.addObject("companyName", companyName);
		mv.addObject("planemodelList", pnameList);
		mv.addObject("companyList", CompanyList);
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
