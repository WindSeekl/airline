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
	public String insertCustomer(Customer customer) {
		// TODO Auto-generated method stub
		Customer cust = customerRepository.queryCustomer(customer.getCustomerName());
		if(cust == null) {
			customerRepository.insertCustomer(customer);
			return "增加成功";
		} else {
			return "客户已存在";
		}
	}
}
