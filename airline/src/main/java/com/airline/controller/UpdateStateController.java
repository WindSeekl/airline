package com.airline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Reserve;
import com.airline.service.ReserveService;

@RestController
public class UpdateStateController {
	@Autowired
	private ReserveService reserveService;
	@RequestMapping("cancelOrder")
	public ModelAndView cancelOrder(Reserve reserve,String state) {
		ModelAndView mv = new ModelAndView("order/ordershow");
		state = "订单已取消";
		reserve.setState(state);
		int str = reserveService.updateState(reserve);
		mv.addObject("state",str);
		return mv;
	}
	@RequestMapping("applyForRefund")
	public ModelAndView applyForRefund(Reserve reserve,String state) {
		ModelAndView mv = new ModelAndView("order/ordershow");
		state = "退票审核中";
		reserve.setState(state);
		int str = reserveService.updateState(reserve);
		mv.addObject("state",str);
		return mv;
	}
	@RequestMapping("pay")
	public ModelAndView pay(Reserve reserve,String state) {
		ModelAndView mv = new ModelAndView("order/ordershow");
		state = "购票审核中";
		reserve.setState(state);
		int str = reserveService.updateState(reserve);
		mv.addObject("state",str);
		return mv;
	}
}
