package com.airline.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Customer;
import com.airline.repository.CustomerRepository;
import com.airline.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public String insertCustomer(Customer customer, String mark) {
		// TODO Auto-generated method stub
		Customer cust = customerRepository.queryCustomer(customer.getCustomerName());
		if(cust == null) {
			customerRepository.insertCustomer(customer);
			if(mark.equals("注册"))
				return "注册成功";
			else
				return "增加成功";
		} else
			return "客户已存在";
	}

	@Override
	public String editPassword(Customer customer, String oldPassword) {
		// TODO Auto-generated method stub
		Customer cust = customerRepository.queryCustomer(customer.getCustomerName());
		if(cust.getPassword().equals(oldPassword)) {
			if(!cust.getPassword().equals(customer.getPassword())){
				customerRepository.editPassword(customer);
				return "修改成功";
			} else
				return "新密码不能与旧密码相同";
		} else
			return "旧密码错误";
	}
}
