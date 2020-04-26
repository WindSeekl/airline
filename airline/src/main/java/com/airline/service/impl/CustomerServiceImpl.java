package com.airline.service.impl;

import java.util.List;

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
				return "注册成功，即将前往登录";
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

	@Override
	public String login(Customer customer) {
		// TODO Auto-generated method stub
		Customer cust = customerRepository.queryCustomer(customer.getCustomerName());
		if(cust != null) {
			if(cust.getPassword().equals(customer.getPassword())) {
				return "登录成功";
			} else
				return "密码错误";
		} else
			return "用户不存在";
	}

	@Override
	public String editInfo(Customer customer) {
		// TODO Auto-generated method stub
		Customer cust = customerRepository.queryCustomer(customer.getCustomerName());
		System.out.println(cust);
		System.out.println(customer);
		if(!cust.getPhone().equals(customer.getPhone()) || !cust.getEmail().equals(customer.getEmail())){
			customerRepository.editInfo(customer);
			return "修改成功";
		}
		return "信息相同，修改失败";
	}

	@Override
	public List<Customer> queryCustomers() {
		// TODO Auto-generated method stub
		return customerRepository.queryCustomers();
	}

	@Override
	public Customer loginInfo(String customerName) {
		// TODO Auto-generated method stub
		return customerRepository.queryCustomer(customerName);
	}

	@Override
	public void addIntegral(Customer customer) {
		// TODO Auto-generated method stub
		customerRepository.addIntegral(customer);
	}
}
