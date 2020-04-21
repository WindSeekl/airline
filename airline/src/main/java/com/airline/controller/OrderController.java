package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Customer;
import com.airline.domain.Reserve;
import com.airline.service.CustomerService;
import com.airline.service.FlightService;
import com.airline.service.ReserveService;

import net.sf.json.JSONObject;

@RestController
public class OrderController {
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private FlightService flightService;
	@Autowired
	private CustomerService customerService;
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
	@RequestMapping("insertReserve")
	public JSONObject insertReserve(HttpSession session,Reserve reserve) {
		Map<String, String> map = new HashMap<String, String>();
		String res = reserveService.insertReserve(reserve);
		String customerName = (String) session.getAttribute("customer");
		int discountPrice = (int) session.getAttribute("discountPrice");
		System.out.println(discountPrice);
		Customer customer = customerService.loginInfo(customerName);
		customer.setIntegral(discountPrice);
		customerService.addIntegral(customer);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
