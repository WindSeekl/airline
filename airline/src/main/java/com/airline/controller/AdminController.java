package com.airline.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

	@RequestMapping(value="/findByIdAdmin")
	public ModelAndView findByIdAdmin(String adminName) {
		ModelAndView mv = new ModelAndView("background/updatenormaladmin");
		mv.addObject("adminName", adminName);
		return mv;
	}

	@RequestMapping(value="/updateAdmin", method = RequestMethod.POST)
	public JSONObject updateAdmin(Admin admin, String retypepassword) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(admin.getPassword().equals(retypepassword)){
			res = adminService.updateAdmin(admin);
		} else
			res = "两次输入密码必须相同";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}

	@RequestMapping(value="/deleteAdmin", method = RequestMethod.POST)
	public JSONObject deleteAdmin(String adminName) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		res = adminService.deleteAdmin(adminName);
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping(value="/loginAdmin", method = RequestMethod.POST)
	public JSONObject loginAdmin(Admin admin, HttpServletRequest req) {
		String res = null;
		Map<String,String> map=new HashMap<String, String>();
		if(!admin.getAdminName().isEmpty() && !admin.getPassword().isEmpty()) {
			res = adminService.loginAdmin(admin);
			if(res.equals("登录成功")) {
				admin = adminService.queryadmin(admin.getAdminName());
				req.getSession().setAttribute("admin", admin);
			}
		} else
			res = "用户名或密码不能为空";
		map.put("res", res);
		JSONObject json = JSONObject.fromObject(map);
		return json;
	}
	
	@RequestMapping("/logoutAdmin")
	public ModelAndView logoutAdmin(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("background/login");
		req.getSession().setAttribute("admin", null);
		return mv;
	}
}
