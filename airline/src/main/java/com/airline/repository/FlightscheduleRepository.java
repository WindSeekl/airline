package com.airline.repository;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Flightschedule;
@Mapper
public interface FlightscheduleRepository {
	int insertFlightschedule(Flightschedule flightschedule);
	
}
