package com.airline.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Company;
import com.airline.repository.CompanyRepository;
import com.airline.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService{

	@Autowired
	private CompanyRepository companyRepository;
	
	@Override
	public String insertCompany(Company company) {
		// TODO Auto-generated method stub
		Company com = companyRepository.queryCompany(company.getCompanyName());
		if(com == null) {
			companyRepository.insertCompany(company);
			return "添加成功";
		} else
			return "该公司已存在";
	}

}
