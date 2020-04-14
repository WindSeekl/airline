package com.airline.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.airline.domain.Customer;
import com.airline.service.CustomerService;

import net.sf.json.JSONObject;

@RestController
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	@RequestMapping(value = "/insertCustomer", method = RequestMethod.POST)
	public JSONObject insertCustomer(Customer customer, String retypepassword, HttpServletRequest req, HttpServletResponse resp) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(customer.getCustomerName() != null) {
			if(customer.getPassword().equals(retypepassword))
				res = customerService.insertCustomer(customer);
			else
				res = "两次输入密码必须相同";
		}else
			res = "客户名不能为空";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
