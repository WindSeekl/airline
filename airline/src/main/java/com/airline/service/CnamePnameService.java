package com.airline.service;

import java.util.List;

import com.airline.domain.CnamePname;
import com.airline.domain.Planemodel;

public interface CnamePnameService {
	List<String> queryCnamePname(String companyName);
	List<Planemodel> queryPname(List<String> list);
	List<Planemodel> queryNotPname(List<String> list);
	void deleteCnamePname(CnamePname cnamePname);
	void insertCnamePname(CnamePname cnamePname);
}
