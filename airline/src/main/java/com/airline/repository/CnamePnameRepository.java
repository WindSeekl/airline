package com.airline.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.airline.domain.CnamePname;
import com.airline.domain.Planemodel;
@Mapper
public interface CnamePnameRepository {
	List<CnamePname> queryCnamePname(String companyName);
	List<Planemodel> queryPname(List<String> list);
	List<Planemodel> queryNotPname(List<String> list);
	void deleteCnamePname(CnamePname cnamePname);
	void insertCnamePname(CnamePname cnamePname);
}
