package com.airline.service;

import java.util.List;

import com.airline.domain.Flight;
import com.airline.domain.Flightschedule;
import com.airline.domain.ScheduleInfo;

public interface ScheduleInfoService {
	List<Flight> queryScheduleAllFlight(Flightschedule flightschedule);
	List<Flight> queryScheduleNotAllFlight(Flightschedule flightschedule);
	void deleteScheduleInfo(String flightNo);
	void insertScheduleInfo(ScheduleInfo scheduleInfo);
}
