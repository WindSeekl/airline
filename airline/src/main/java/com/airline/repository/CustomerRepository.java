package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Customer;

@Mapper
public interface CustomerRepository {
	int insertCustomer(Customer customer);
	
	Customer queryCustomer(String customerName);
	
	List<Customer> queryCustomers();
	
	int editPassword(Customer customer);
	
	int editInfo(Customer customer);
	
	void addIntegral(Customer customer);
}
