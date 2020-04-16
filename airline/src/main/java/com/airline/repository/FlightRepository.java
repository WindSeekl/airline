package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Flight;
@Mapper
public interface FlightRepository {
	List<Flight> queryFlight();
	Flight queryFlightOne(String flightNo);
	int insertFlight(Flight flight);
	int updateFlight(Flight flight);
	int deleteFlight(Flight flight);
}
