package com.airline.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Reserve;
import com.airline.repository.ReserveRepository;
import com.airline.service.ReserveService;
@Service
public class ReserveServiceImpl implements ReserveService{
	@Autowired
	private ReserveRepository reserveRepository;

	@Override
	public List<Reserve> queryReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveRepository.queryReserve(reserve);
	}

	@Override
	public String insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		reserve.setReserveId(reserveId());
		reserve.setOrderDate(newDate());
		String res ;
		if(reserve.getUserName().isEmpty()&&reserve.getCardId().isEmpty()&&reserve.getPhoneNum().isEmpty()) {
			res="订单信息不完成";
		}else {
			int i = reserveRepository.insertReserve(reserve);
			res = i==1?"下单成功":"下单失败";
		}
		return res;
	}

	@Override
	public int updateState(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveRepository.updateState(reserve);
	}

	@Override
	public Reserve queryReserveDetail(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveRepository.queryReserveDetail(reserve); 
	}
	@Override
	public int querySeatNum(String seatId) {
		// TODO Auto-generated method stub
		return reserveRepository.querySeatNum(seatId);
	}
	public String reserveId(){
		return String.valueOf((int)(Math.random()*(999999-100000+1)+100000));
	}
	public String newDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		return date;
	}
}
