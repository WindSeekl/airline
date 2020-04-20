package com.airline.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Flightschedule;
import com.airline.repository.FlightscheduleRepository;
import com.airline.service.FlightscheduleService;
@Service
public class FlightscheduleServiceImpl implements FlightscheduleService{
	@Autowired
	private FlightscheduleRepository flightscheduleRepository;
	@Override
	public String insertFlightschedule(Flightschedule flightschedule) {
		// TODO Auto-generated method stub
		int  i = flightscheduleRepository.insertFlightschedule(flightschedule);
		return i==1?"添加成功":"添加失败";
	}
}
