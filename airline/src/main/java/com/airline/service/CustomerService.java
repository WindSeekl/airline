package com.airline.service;

import com.airline.domain.Customer;

public interface CustomerService {
	String insertCustomer(Customer customer, String mark);
	
	String editPassword(Customer customer, String oldPassword);
}
