package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		String customerName = (String) session.getAttribute("customer");   //从session中获取登录用户的用户名
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
	
	@RequestMapping("/queryAllReserve")
	public ModelAndView queryAllReserve() {
		ModelAndView mv = new ModelAndView("background/ticketjuge");
		List<Reserve> reserve = reserveService.queryAllReserve();
		mv.addObject("reserves", reserve);
		return mv;
	}
	
	@RequestMapping(value="/dealWaiteOrder",method=RequestMethod.POST)
	public JSONObject dealWaiteOrder(Reserve reserve) {
		String res = null;
		Map<String, String> map = new HashMap<String, String>();
		if(reserve.getState().equals("购票审核中")) {
			reserve.setState("购票成功");
			reserveService.dealWaiteOrder(reserve);
			res = "审核通过，购票成功";
		} 
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value="/OrderNotPass",method=RequestMethod.POST)
	public JSONObject OrderNotPass(Reserve reserve) {
		String res = null;
		Map<String, String> map = new HashMap<String, String>();
		if(reserve.getState().equals("购票审核中")) {
			reserve.setState("购票失败");
			reserveService.dealWaiteOrder(reserve);
			res = "审核不通过，购票失败";
		}
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value="/RefundAudit")
	public ModelAndView  Standby() {
		ModelAndView mv = new ModelAndView("background/bounce");
		List<Reserve> Refund = reserveService.queryRefund();
		mv.addObject("Refund", Refund);
		return mv;
	}
	@RequestMapping(value="/Confirm",method=RequestMethod.POST)
	public JSONObject Confirm(Reserve reserve) {
		String res = null;
		Map<String, String> map = new HashMap<String, String>();
		if(reserve.getState().equals("退票审核中")) {
			reserve.setState("退票成功");
			reserveService.RefundWaiteOrder(reserve);
			res = "审核通过，退票成功";
		} 
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	@RequestMapping(value="/Cancel",method=RequestMethod.POST)
	public JSONObject cancel(Reserve reserve) {
		String res = null;
		Map<String, String> map = new HashMap<String, String>();
		if(reserve.getState().equals("退票审核中")) {
			reserve.setState("退票失败");
			reserveService.RefundWaiteOrder(reserve);
			res = "审核不通过，退票失败";
		} 
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	@RequestMapping("queryByCardId")
	public ModelAndView queryByCardId(String cardId) {
		ModelAndView mv = new ModelAndView("background/printtable");
		List<Reserve> list = reserveService.queryByCardId(cardId);
		mv.addObject("cardId", cardId);
		mv.addObject("cardIdList", list);
		return mv;
	}
	@RequestMapping("updateStateByReserveId")
	public ModelAndView updateStateByReserveId(String reserveId,String cardId) {
		ModelAndView mv = new ModelAndView("forward:queryByCardId");
		reserveService.updateStateByReserveId(reserveId);
		mv.addObject("cardId", cardId);
		return mv;
	}
}
