package com.airline.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.airline.domain.CnamePname;
import com.airline.domain.Planemodel;
import com.airline.repository.CnamePnameRepository;
import com.airline.service.CnamePnameService;
@Service
public class CnamePnameServiceImpl implements CnamePnameService{
	@Autowired
	private CnamePnameRepository cnamePnameRepository;
	@Override
	public List<String> queryCnamePname(String companyName) {
		// TODO Auto-generated method stub
		List<CnamePname> list = cnamePnameRepository.queryCnamePname(companyName);
		List<String> pnamelist=new ArrayList<String>();
		String planemodelName="";
		if(list.size()!=0) {
			for (CnamePname cnamePname : list) {
				pnamelist.add(cnamePname.getPlanemodelName());
			}
		}else {
			pnamelist.add(planemodelName);
		}
		return pnamelist;
	}

	@Override
	public List<Planemodel> queryPname(List<String> list) {
		// TODO Auto-generated method stub
		return cnamePnameRepository.queryPname(list);
	}

	@Override
	public List<Planemodel> queryNotPname(List<String> list) {
		// TODO Auto-generated method stub
		return cnamePnameRepository.queryNotPname(list);
	}

	@Override
	public void deleteCnamePname(CnamePname cnamePname) {
		// TODO Auto-generated method stub
		cnamePnameRepository.deleteCnamePname(cnamePname);
	}

	@Override
	public void insertCnamePname(CnamePname cnamePname) {
		// TODO Auto-generated method stub
		cnamePnameRepository.insertCnamePname(cnamePname);
	}

}
