package com.airline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Reserve;
import com.airline.service.ReserveService;

@RestController
public class OrderController {
	@Autowired
	private ReserveService reserveService;
	@RequestMapping("queryOrder")
	public ModelAndView queryOrder(Reserve reserve) {
		List<Reserve> list = reserveService.queryReserve(reserve);
		System.out.println(list);
		ModelAndView mv = new ModelAndView();
		return mv;
	}
}
