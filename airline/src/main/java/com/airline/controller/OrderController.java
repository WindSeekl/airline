package com.airline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Flight;
import com.airline.domain.Reserve;
import com.airline.service.FlightService;
import com.airline.service.ReserveService;

@RestController
public class OrderController {
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private FlightService flightService;
	@RequestMapping("queryOrder")
	public ModelAndView queryOrder(HttpSession session,Reserve reserve) {
		String customerName = (String) session.getAttribute("uname");   //从session中获取登录用户的用户名
		ModelAndView mv = new ModelAndView("order/ordershow");
		reserve.setCustomerName(customerName);
		List<Reserve> list = reserveService.queryReserve(reserve);
		mv.addObject("reserveList", list);
		return mv;
	}
	@RequestMapping("queryReserveDetail")
	public ModelAndView queryReserveDetail(HttpSession session,Reserve reserve) {
		ModelAndView mv = new ModelAndView("order/ordershowdetail");
		Reserve r = reserveService.queryReserveDetail(reserve);
		String flightNo = r.getFlightId();//获取航班号
		String companyName = flightService.queryFlightOne(flightNo).getCompanyName();//根据航班号获取航空公司
		mv.addObject("companyName", companyName);
		mv.addObject("reserveDetail", r);
		return mv;
	}
	
}
