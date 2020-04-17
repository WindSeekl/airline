package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.Admin;

@Mapper
public interface AdminRepository {
	Admin queryAdmin(String adminName);
	
	List<Admin> queryAminds();
	
	int insertAdmin(Admin admin);
	
	int updateAdmin(Admin admin);
	
	int deleteAdmin(String adminName);
}
