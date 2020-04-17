package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.airline.domain.Admin;
import com.airline.service.AdminService;

import net.sf.json.JSONObject;

@RestController
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/insertAdmin", method = RequestMethod.POST)
	public JSONObject insertAdmin(Admin admin, String retypepassword) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		admin.setPermission(1);
		if(!admin.getAdminName().isEmpty() && !admin.getPassword().isEmpty() && !retypepassword.isEmpty()) {
			if(admin.getPassword().equals(retypepassword))
				res = adminService.insertAdmin(admin);
			else
				res = "两次输入密码不一致";
		} else
			res = "请完善所有信息";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value="/findAllAdmin")
	public ModelAndView findAllAdmin() {
		ModelAndView mv = new ModelAndView("background/findnormaladmin");
		List<Admin> list = adminService.qeuryAdmins();
		mv.addObject("admins", list);
		return mv;
	}
}
