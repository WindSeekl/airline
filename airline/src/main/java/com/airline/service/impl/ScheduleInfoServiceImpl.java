package com.airline.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Flight;
import com.airline.domain.Flightschedule;
import com.airline.domain.ScheduleInfo;
import com.airline.repository.ScheduleInfoRepository;
import com.airline.service.ScheduleInfoService;
@Service
public class ScheduleInfoServiceImpl implements ScheduleInfoService{
	@Autowired
	private ScheduleInfoRepository scheduleInfoRepository;
	
	public List<String> queryScheduleInfo(int flightscheduleId) {
		// TODO Auto-generated method stub
		List<ScheduleInfo> list = scheduleInfoRepository.queryScheduleInfo(flightscheduleId);
		List<String> flightNoList=new ArrayList<String>();
		String flightNo="";
		if(list.size()!=0) {
			for (ScheduleInfo scheduleInfo : list) {
				flightNo=scheduleInfo.getFlightNo();
				flightNoList.add(flightNo);
			}
		}else {
			flightNoList.add(flightNo);
		}
		return flightNoList;
	}
	@Override
	public List<Flight> queryScheduleAllFlight(Flightschedule flightschedule){
		// TODO Auto-generated method stub
		List<Flight> flightList = scheduleInfoRepository.queryScheduleAllFlight(queryScheduleInfo(flightschedule.getFlightscheduleId()));
		List<Flight> accordFlightList = accordFlight(flightList,flightschedule);
		return accordFlightList;
	}
	@Override
	public List<Flight> queryScheduleNotAllFlight(Flightschedule flightschedule){
		// TODO Auto-generated method stub
		List<Flight> notFlightList = scheduleInfoRepository.queryScheduleNotAllFlight(queryScheduleInfo(flightschedule.getFlightscheduleId()));
		List<Flight> notAccordFlightList = accordFlight(notFlightList,flightschedule);
		return notAccordFlightList;
	}
	public List<Flight> accordFlight(List<Flight> list,Flightschedule flightschedule) {
		// TODO Auto-generated method stub
		List<Flight> accordFlightList = new ArrayList<Flight>();
		for (Flight flight : list) {
			flight.setTravelDate(getTravelDate(flight));
			if(flightschedule.getBeginSite().equals(flight.getBeginSite())&&flightschedule.getEndSite().equals(flight.getEndSite())){
				accordFlightList.add(flight);
			}
		}
		return accordFlightList;
	}
	@Override
	public void deleteScheduleInfo(String flightNo) {
		// TODO Auto-generated method stub
		scheduleInfoRepository.deleteScheduleInfo(flightNo);
	}
	@Override
	public void insertScheduleInfo(ScheduleInfo scheduleInfo) {
		// TODO Auto-generated method stub
		scheduleInfoRepository.insertScheduleInfo(scheduleInfo);
	}
	public String getTravelDate(Flight flight) {
		SimpleDateFormat sdf = new SimpleDateFormat( "HH:mm:ss" );
		String travelDate = null;
		try {
			Date bTime = (Date) sdf.parse(flight.getBeginTime());
			Date eTime = (Date) sdf.parse(flight.getEndTime());
			long tTime=eTime.getTime()-bTime.getTime();
			int i = (int) (tTime/1000/60);
			int hTime = i/60;
			int mTime = i%60;
			travelDate = hTime+"时"+mTime+"分";
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return travelDate;
	}
}
