package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Flight;
import com.airline.domain.ScheduleInfo;

@Mapper
public interface ScheduleInfoRepository {
	List<ScheduleInfo> queryScheduleInfo(int flightscheduleId);
	List<Flight> queryScheduleAllFlight(List<String> list);
	List<Flight> queryScheduleNotAllFlight(List<String> list);
	void deleteScheduleInfo(String flightNo);
	void insertScheduleInfo(ScheduleInfo scheduleInfo);
}
