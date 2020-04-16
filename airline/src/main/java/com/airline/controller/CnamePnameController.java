package com.airline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.CnamePname;
import com.airline.domain.Company;
import com.airline.domain.Planemodel;
import com.airline.service.CnamePnameService;
import com.airline.service.impl.CompanyServiceImpl;
@RestController
public class CnamePnameController {
	@Autowired
	private CompanyServiceImpl companyServiceImpl;
	@Autowired
	private CnamePnameService cnamePnameService;
	@RequestMapping("queryCnamePname")
	public ModelAndView queryCnamePname() {
		ModelAndView mv = new ModelAndView("background/addcompanyplanemodel");
		List<Company> CompanyList = companyServiceImpl.queryCompanys();
		mv.addObject("companyList", CompanyList);
		return mv;
	}
	@RequestMapping("queryPname")
	public ModelAndView queryPname(String companyName) {
		ModelAndView mv = new ModelAndView("background/addcompanyplanemodel");
		List<Company> CompanyList = companyServiceImpl.queryCompanys();
		List<String> list=cnamePnameService.queryCnamePname(companyName);
		List<Planemodel> pnameList=cnamePnameService.queryPname(list);
		List<Planemodel> notPnameList=cnamePnameService.queryNotPname(list);
		mv.addObject("companyName", companyName);
		mv.addObject("companyList", CompanyList);
		mv.addObject("pnameList", pnameList);
		mv.addObject("notPnameList", notPnameList);
		return mv;
	}
	@RequestMapping("insertCnamePname")
	public ModelAndView insert(CnamePname cnamePname) {
		ModelAndView mv = new ModelAndView("forward:queryPname");
		cnamePnameService.insertCnamePname(cnamePname);
		return mv;
	}
	@RequestMapping("deleteCnamePname")
	public ModelAndView deleteCnamePname(CnamePname cnamePname) {
		ModelAndView mv = new ModelAndView("forward:queryPname");
		cnamePnameService.deleteCnamePname(cnamePname);
		return mv;
	}
}
