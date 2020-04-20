package com.airline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Flight;
import com.airline.domain.Flightschedule;
import com.airline.domain.ScheduleInfo;
import com.airline.service.FlightscheduleService;
import com.airline.service.ScheduleInfoService;

@RestController
public class ScheduleInfoController {
	@Autowired
	private ScheduleInfoService scheduleInfoService;
	@Autowired 
	private FlightscheduleService flightscheduleService;
	@RequestMapping("/setScheduleInfo")
	public ModelAndView setScheduleInfo(Flightschedule flightschedule,HttpSession session){
		ModelAndView mv = new ModelAndView("forward:queryScheduleInfo");
		int flightscheduleId = flightscheduleService.queryOneFlightschedule(flightschedule);
		flightschedule.setFlightscheduleId(flightscheduleId);
		session.setAttribute("flightschedule", flightschedule);
		return mv;
	}
	@RequestMapping("/queryScheduleInfo")
	public ModelAndView queryScheduleInfo(HttpSession session) {
		Flightschedule flightschedule = (Flightschedule) session.getAttribute("flightschedule");
		ModelAndView mv = new ModelAndView("background/addschedule");
		List<Flight> accordFlightList = scheduleInfoService.queryScheduleAllFlight(flightschedule);
		List<Flight> notAccordFlightList = scheduleInfoService.queryScheduleNotAllFlight(flightschedule);
		mv.addObject("flightscheduleId", flightschedule.getFlightscheduleId());
		mv.addObject("accordFlightList", accordFlightList);
		mv.addObject("notAccordFlightList", notAccordFlightList);
		return mv;
	}
	@RequestMapping("/deleteScheduleInfo")
	public ModelAndView deleteScheduleInfo(String flightNo) {
		ModelAndView mv = new ModelAndView("forward:queryScheduleInfo");
		scheduleInfoService.deleteScheduleInfo(flightNo);
		return mv;
	}
	@RequestMapping("/insertScheduleInfo")
	public ModelAndView insertScheduleInfo(ScheduleInfo scheduleInfo) {
		ModelAndView mv = new ModelAndView("forward:queryScheduleInfo");
		scheduleInfoService.insertScheduleInfo(scheduleInfo);
		return mv;
	}
}
