package com.airline.service;

import com.airline.domain.Customer;

public interface CustomerService {
	String login(Customer customer);
	
	String insertCustomer(Customer customer, String mark);
	
	String editPassword(Customer customer, String oldPassword);
	
	String editInfo(Customer customer);
}
