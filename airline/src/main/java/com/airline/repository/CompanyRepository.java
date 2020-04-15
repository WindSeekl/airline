package com.airline.repository;

import org.apache.ibatis.annotations.Insert;

import com.airline.domain.Company;

public interface CompanyRepository {
	@Insert(value="")
	int insertCompany(Company company);
}
