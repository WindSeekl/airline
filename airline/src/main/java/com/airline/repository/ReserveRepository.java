package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Reserve;
@Mapper
public interface ReserveRepository {
	List<Reserve> queryReserve(Reserve reserve);//查询订单(用户名/订单号/订票日期)
	Reserve queryReserveDetail(Reserve reserve);//查询订单详情
	int querySeatNum(String seatId);//查询舱位数量
	int insertReserve(Reserve reserve);//下单
	int updateState(Reserve reserve);//订单状态
	Reserve queryOneReserve(Reserve reserve);
}

