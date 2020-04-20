package com.airline.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airline.domain.Flightschedule;
import com.airline.service.FlightscheduleService;

import net.sf.json.JSONObject;
@RestController
public class FlightscheduleController {
	@Autowired
	private FlightscheduleService flightscheduleService;
	@RequestMapping("insertFlightschedule")
	public JSONObject insertFlight(Flightschedule flightschedule) {
		Map<String, String> map = new HashMap<String, String>();
		String res = flightscheduleService.insertFlightschedule(flightschedule);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
