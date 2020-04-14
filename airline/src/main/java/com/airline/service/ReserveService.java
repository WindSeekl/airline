package com.airline.service;

import java.util.List;

import com.airline.domain.Reserve;

public interface ReserveService {
	List<String> queryReserve(Reserve reserve);//查询订单(用户名/订单号/订票日期)
	int insertReserve(Reserve reserve);//下单
	int updateState(Reserve reserve);//订单状态
}