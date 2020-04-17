package com.airline.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.Admin;
import com.airline.repository.AdminRepository;
import com.airline.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminRepository adminRepository;
	
	@Override
	public String insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Admin ad = adminRepository.queryAdmin(admin.getAdminName());
		if(ad == null) {
			adminRepository.insertAdmin(admin);
			return "添加成功";
		} else
			return "管理员已存在";
	}

	@Override
	public List<Admin> qeuryAdmins() {
		// TODO Auto-generated method stub
		return adminRepository.queryAminds();
	}

	@Override
	public String updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		Admin ad = adminRepository.queryAdmin(admin.getAdminName());
		if(!ad.getPassword().equals(admin.getPassword())) {
			adminRepository.updateAdmin(admin);
			return "修改成功";
		}
		return "密码一样改你🐎";
	}

	@Override
	public String deleteAdmin(String adminName) {
		// TODO Auto-generated method stub
		adminRepository.deleteAdmin(adminName);
		return "删除成功";
	}

	
}
