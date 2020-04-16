package com.airline.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.airline.domain.Company;
import com.airline.service.CompanyService;

import net.sf.json.JSONObject;

@RestController
public class CompanyController {
	
	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/insertCompany")
	public JSONObject insertCompany(Company company) {
		String res = null;
		Map<String, String> map = new HashMap<String, String>();
		res = companyService.insertCompany(company);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
