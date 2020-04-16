package com.airline.repository;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Company;

@Mapper
public interface CompanyRepository {
	Company queryCompany(String companyName);
	
	int insertCompany(Company company);
}
