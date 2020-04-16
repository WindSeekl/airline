package com.airline.service;

import java.util.List;

import com.airline.domain.Flight;

public interface FlightService {
	List<Flight> queryFlight();
	Flight queryFlightOne(String flightNo);
	String insertFlight(Flight flight);
	String updateFlight(Flight flight);
	int deleteFlight(Flight flight);
}
