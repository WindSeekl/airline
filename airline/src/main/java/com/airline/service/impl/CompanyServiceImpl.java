package com.airline.service.impl;

import java.util.List;

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

	@Override
	public List<Company> queryCompanys() {
		// TODO Auto-generated method stub
		return companyRepository.queryCompanys();
	}

	@Override
	public String deleteCompany(String companyName) {
		// TODO Auto-generated method stub
		companyRepository.deleteCompany(companyName);
		return "删除成功";
	}

	@Override
	public String updateCompany(Company company) {
		// TODO Auto-generated method stub
		companyRepository.updateCompany(company);
		return "修改成功";
	}

}
