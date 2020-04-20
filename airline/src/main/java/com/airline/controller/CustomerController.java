package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Customer;
import com.airline.service.CustomerService;

import net.sf.json.JSONObject;

@RestController
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value = "/insertCustomer", method = RequestMethod.POST)
	public JSONObject insertCustomer(Customer customer, String retypepassword, String mark) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(!customer.getCustomerName().isEmpty()) {
			if(customer.getPassword().equals(retypepassword))
				res = customerService.insertCustomer(customer, mark);
			else
				res = "两次输入密码必须相同";
		}else
			res = "客户名不能为空";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value = "/editPassword", method = RequestMethod.POST)
	public JSONObject editPassword(String oldPassword, Customer customer, String retypepassword) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(!customer.getPassword().isEmpty()) {
			if(customer.getPassword().equals(retypepassword)) {
				res = customerService.editPassword(customer, oldPassword);
			} else
				res = "两次输入密码不一致";
		} else
			res = "新密码不能为空";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value = "/editInfo", method = RequestMethod.POST)
	public JSONObject editInfo(Customer customer) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(!customer.getPassword().isEmpty()) {
			res = customerService.editInfo(customer);
		} else
			res = "信息不能为空";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value = "/queryCustomers")
	public ModelAndView queryCustomers(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("background/findcustomer");
		List<Customer> list = customerService.queryCustomers();
		req.getSession().setAttribute("customers", list);
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public JSONObject login(Customer customer, HttpServletRequest req) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(!customer.getCustomerName().isEmpty() && !customer.getPassword().isEmpty()) {
			res = customerService.login(customer);
			if(res.equals("登录成功"))
				req.getSession().setAttribute("customer", customer.getCustomerName());
		} else 
			res = "账户名和密码不能为空";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("login");
		req.getSession().setAttribute("customer", null);
		return mv;
	}
}
