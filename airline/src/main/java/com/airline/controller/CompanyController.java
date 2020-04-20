package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping("/queryCompanys")
	public ModelAndView queryCompanys() {
		ModelAndView mv = new ModelAndView("background/findcompany");
		List<Company> list = companyService.queryCompanys();
		mv.addObject("companys", list);
		return mv;
	}
	
	@RequestMapping(value="/findByIdCompany")
	public ModelAndView findByIdCompany(String companyName) {
		ModelAndView mv = new ModelAndView("background/updatecompany");
		mv.addObject("companyName", companyName);
		return mv;
	}

	/*@RequestMapping("/deleteCompany")
	public ModelAndView deleteCompany(Company company) {
		ModelAndView mv = new ModelAndView("forward:queryCompanys");
		companyService.deleteCompany(company.getCompanyName());
		return mv;
	}*/
	
	@RequestMapping(value="/deleteCompany", method = RequestMethod.POST)
	public JSONObject deleteCompany(Company company) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		res = companyService.deleteCompany(company.getCompanyName());
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping("/getCompanyInfo")
	public ModelAndView getCompanyInfo() {
		ModelAndView mv = new ModelAndView("background/updatecompany");
		List<Company> list = companyService.queryCompanys();
		mv.addObject("companyInfo", list);
		return mv;
	}
	
	@RequestMapping(value = "/updateCompany", method = RequestMethod.POST)
	public JSONObject updateCompany(Company company) {
		String res = null;
		System.out.println(company);
		Map<String, String> map = new HashMap<String, String>();
		res = companyService.updateCompany(company);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
}
