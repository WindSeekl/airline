package com.airline.service;

import java.util.List;

import com.airline.domain.Admin;

public interface AdminService {
	String insertAdmin(Admin admin);
	
	List<Admin> qeuryAdmins();
}
