package com.airline.service;

import com.airline.domain.Flightschedule;

public interface FlightscheduleService {
	String insertFlightschedule(Flightschedule flightschedule);
	int queryOneFlightschedule(Flightschedule flightschedule);
}
