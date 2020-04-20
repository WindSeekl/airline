package com.airline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Flight;
import com.airline.repository.FlightRepository;
import com.airline.service.FlightService;
@Service
public class FlightServiceImpl implements FlightService{
	@Autowired
	private FlightRepository flightRepository;
	@Override
	public List<Flight> queryFlight() {
		// TODO Auto-generated method stub
		return flightRepository.queryFlight();
	}

	@Override
	public Flight queryFlightOne(String flightNo) {
		// TODO Auto-generated method stub
		return flightRepository.queryFlightOne(flightNo);
	}

	@Override
	public String insertFlight(Flight flight) {
		// TODO Auto-generated method stub
		Flight f = flightRepository.queryFlightOne(flight.getFlightNo());
		String res = null;
		if(flight.getFlightNo().isEmpty()||flight.getBeginSite().isEmpty()||flight.getBeginTime().isEmpty()||flight.getBeginAir().isEmpty()||flight.getEndAir().isEmpty()||flight.getEndSite().isEmpty()||flight.getEndTime().isEmpty()) {
			res = "添加失败,信息不完整";
		}else{
			if(f!=null) {
				res = "该航班已添加";
			}else {
				int i = flightRepository.insertFlight(flight);
				res = i==1?"添加成功":"添加失败";
			}
		}
		return res;
	}

	@Override
	public String updateFlight(Flight flight) {
		// TODO Auto-generated method stub
		int i = flightRepository.updateFlight(flight);
		return i==1?"修改成功":"修改失败";
	}

	@Override
	public void deleteFlight(String flightNo) {
		flightRepository.deleteFlight(flightNo);
	}
	@Override
	public List<Flight> queryFlightBySite(Flight flight) {
		// TODO Auto-generated method stub
		return flightRepository.queryFlightBySite(flight);
	}
}
