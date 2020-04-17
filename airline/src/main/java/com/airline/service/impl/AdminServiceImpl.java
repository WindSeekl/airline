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

}
