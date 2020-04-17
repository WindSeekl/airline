package com.airline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.airline.domain.Reserve;
import com.airline.service.ReserveService;

import net.sf.json.JSONArray;



@RestController
public class OrderController {
	@Autowired
	private ReserveService reserveService;
	private Reserve re = new Reserve();
	@RequestMapping(value = "/queryOrder", method = RequestMethod.POST)
	public JSONArray queryOrder(Reserve reserve) {
		List<Reserve> list = reserveService.queryReserve(reserve);
		JSONArray json = JSONArray.fromObject(list);
		//System.out.println(list);
		return json;
	}
}
