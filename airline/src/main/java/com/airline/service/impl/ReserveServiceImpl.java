package com.airline.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
		List<Reserve> list = reserveRepository.queryReserve(reserve);
		List<Reserve> list2 = new ArrayList<Reserve>();
		if(!reserve.getOrderDate().isEmpty()) {
			for (Reserve e : list) {
				String orderDate=orderDate(e.getOrderDate());
				if(orderDate.equals(reserve.getOrderDate())) {
					list2.add(e);
				}
			}
			return list2;
		}
		return list;
	}

	@Override
	public String insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		reserve.setReserveId(reserveId());
		reserve.setOrderDate(newDate());
		String res ;
		Reserve r = queryOneReserve(reserve);
		if(r==null) {
			if(reserve.getUserName().isEmpty()&&reserve.getCardId().isEmpty()&&reserve.getPhoneNum().isEmpty()) {
				res="订单信息不完成";
			}else {
				int i = reserveRepository.insertReserve(reserve);
				res = i==1?"下单成功":"下单失败";
			}
			
		}else {
			res="同一趟航班限订一张";
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
	public String reserveId(){
		return String.valueOf((int)(Math.random()*(999999-100000+1)+100000));
	}
	public String newDate(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(new Date());
		return date;
	}
	public String orderDate(String orderDate){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = null;
		try {
			date = sdf.format(sdf.parse(orderDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return date;
	}

	@Override
	public Reserve queryOneReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveRepository.queryOneReserve(reserve);
	}
	
	@Override
	public List<Reserve> queryAllReserve() {
		// TODO Auto-generated method stub
		return reserveRepository.queryAllReserve();
	}

	@Override
	public void dealWaiteOrder(Reserve reserve) {
		// TODO Auto-generated method stub
		reserveRepository.dealWaiteOrder(reserve);
	}
	
	@Override
	public List<Reserve> queryRefund() {
		// TODO Auto-generated method stub
		return reserveRepository.queryRefund();
	}
	
	@Override
	public void RefundWaiteOrder(Reserve reserve) {
		// TODO Auto-generated method stub
		reserveRepository.RefundWaiteOrder(reserve);
	}

	@Override
	public List<Reserve> queryByCardId(String cardId) {
		// TODO Auto-generated method stub
		return reserveRepository.queryByCardId(cardId);
	}

	@Override
	public void updateStateByReserveId(String reserveId) {
		// TODO Auto-generated method stub
		reserveRepository.updateStateByReserveId(reserveId);
	}

	@Override
	public int querySeatNum(String flightId, String seatId) {
		// TODO Auto-generated method stub
		Reserve reserve = new Reserve();
		reserve.setFlightId(flightId);
		reserve.setSeatId(seatId);
		return reserveRepository.querySeatNum(reserve);
	}
}
