package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Flight;
import com.airline.domain.Flightschedule;
import com.airline.service.FlightscheduleService;
import com.airline.service.ScheduleInfoService;

import net.sf.json.JSONObject;
@RestController
public class FlightscheduleController {
	@Autowired
	private FlightscheduleService flightscheduleService;
	@Autowired
	private ScheduleInfoService scheduleInfoService;
	@RequestMapping("insertFlightschedule")
	public JSONObject insertFlight(Flightschedule flightschedule) {
		Map<String, String> map = new HashMap<String, String>();
		String res = flightscheduleService.insertFlightschedule(flightschedule);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	@RequestMapping("queryFlightschedule")
	public ModelAndView queryFlightschedule(Flightschedule flightschedule) {
		ModelAndView mv = new ModelAndView("flight/flightshow");
		int flightscheduleId = flightscheduleService.queryOneFlightschedule(flightschedule);
		flightschedule.setFlightscheduleId(flightscheduleId);
		List<Flight> accordFlightList = scheduleInfoService.queryScheduleAllFlight(flightschedule);
		mv.addObject("flightschedule", flightschedule);
		mv.addObject("size", accordFlightList.size());
		mv.addObject("accordFlightList", accordFlightList);
		return mv; 
	}
	
}
