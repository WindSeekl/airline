package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Company;

@Mapper
public interface CompanyRepository {
	Company queryCompany(String companyName);
	
	List<Company> queryCompanys();
	
	int insertCompany(Company company);
	
	int deleteCompany(String companyName);
	
	int updateCompany(Company company);
}
