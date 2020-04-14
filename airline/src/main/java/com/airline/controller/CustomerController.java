package com.airline.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Customer;
import com.airline.service.CustomerService;
import com.alibaba.fastjson.JSONObject;

@RestController
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@RequestMapping("/insertCustomer")
	public String insertCustomer(Customer customer, String retypepassword, HttpServletRequest req, HttpServletResponse resp) {
		String res = null;
		if(!customer.getCustomerName().isEmpty())
			res = customerService.insertCustomer(customer);
		else
			res = "客户名不能为空";
		HttpSession session = req.getSession();
		session.setAttribute("res", res);
		return "background/addcustomer";
	}
}
