package com.airline.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Company;
import com.airline.domain.Reserve;
import com.airline.service.ReserveService;

import net.sf.json.JSONArray;



@RestController
public class OrderController {
	@Autowired
	private ReserveService reserveService;
	/*private Reserve re = new Reserve();
	@RequestMapping(value = "/queryOrder", method = RequestMethod.POST)
	public JSONArray queryOrder(Reserve reserve) {
		List<Reserve> list = reserveService.queryReserve(reserve);
		JSONArray json = JSONArray.fromObject(list);
		//System.out.println(list);
		return json;
	}*/
	@RequestMapping("queryOrder")
	public ModelAndView queryOrder(HttpSession session,Reserve reserve) {
		/*String customerName = (String) session.getAttribute("uname");*/   //从session中获取登录用户的用户名
		String customerName = "a001";
		ModelAndView mv = new ModelAndView("order/ordershow");
		reserve.setCustomerName(customerName);
		List<Reserve> list = reserveService.queryReserve(reserve);
		mv.addObject("reserveList", list);
		return mv;
	}
}
