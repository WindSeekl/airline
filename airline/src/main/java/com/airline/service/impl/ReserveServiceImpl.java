package com.airline.service.impl;

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
	public int insertReserve(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveRepository.insertReserve(reserve);
	}

	@Override
	public int updateState(Reserve reserve) {
		// TODO Auto-generated method stub
		return reserveRepository.updateState(reserve);
	}

	@Override
	public List<Reserve> queryReserveDetail(Reserve reserve) {
		// TODO Auto-generated method stub
		System.out.println("Service 的 ReserveId： "+reserve.getReserveId());
		return reserveRepository.queryReserveDetail();
	}
}
