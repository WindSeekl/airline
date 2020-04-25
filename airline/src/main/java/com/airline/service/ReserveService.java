package com.airline.service;

import java.util.List;

import com.airline.domain.Reserve;

public interface ReserveService {
	List<Reserve> queryReserve(Reserve reserve);//查询订单(用户名/订单号/订票日期)
	List<Reserve> queryAllReserve();//查询所有订单
	Reserve queryReserveDetail(Reserve reserve);//查询订单详情
	String insertReserve(Reserve reserve);//下单
	int updateState(Reserve reserve);//订单状态 
	int querySeatNum(String seatId);//查询舱位数量
	Reserve queryOneReserve(Reserve reserve);
	void dealWaiteOrder(Reserve reserve);
	List<Reserve> queryRefund();//查询订单
	void  RefundWaiteOrder(Reserve reserve);//退票审核状态修改
	List<Reserve> queryByCardId(String cardId);
	void updateStateByReserveId(String reserveId);
}
