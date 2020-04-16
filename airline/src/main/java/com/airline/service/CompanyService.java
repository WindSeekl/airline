package com.airline.service;

import java.util.List;

import com.airline.domain.Company;

public interface CompanyService {
	String insertCompany(Company company);
	
	List<Company> queryCompanys();
	
	String deleteCompany(String companyName);
	
	String updateCompany(Company company);
}
