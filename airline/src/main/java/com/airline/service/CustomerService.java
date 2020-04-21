package com.airline.service;

import java.util.List;

import com.airline.domain.Customer;

public interface CustomerService {
	String login(Customer customer);
	
	String insertCustomer(Customer customer, String mark);
	
	String editPassword(Customer customer, String oldPassword);
	
	String editInfo(Customer customer);
	
	Customer loginInfo(String customerName);
	
	List<Customer> queryCustomers();
	
	void addIntegral(Customer customer);
}
