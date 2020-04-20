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
		String res=null;
		if(flightschedule.getBeginSite().isEmpty()||flightschedule.getEndSite().isEmpty()||flightschedule.getFsDate().isEmpty()) {
			res="信息不完整";
		}else {
			Flightschedule f = flightscheduleRepository.queryOneFlightschedule(flightschedule);
			if(f==null) {
				int  i = flightscheduleRepository.insertFlightschedule(flightschedule);
				res = i==1?"添加成功":"添加失败";
			}else {
				res="该航班计划已存在，请勿重复添加";
			}
		}
		return res;
	}
	@Override
	public int queryOneFlightschedule(Flightschedule flightschedule) {
		// TODO Auto-generated method stub
		Flightschedule f = flightscheduleRepository.queryOneFlightschedule(flightschedule);
		int i = 0;
		if(f!=null) {
			i = f.getFlightscheduleId();
		}
		return i;
	}
}
