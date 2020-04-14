package com.airline.repository;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Customer;

@Mapper
public interface CustomerRepository {
	int insertCustomer(Customer customer);
	
	Customer queryCustomer(String customerName);
}
