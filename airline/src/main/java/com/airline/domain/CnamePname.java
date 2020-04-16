package com.airline.domain;

public class CnamePname {
	private String companyName;
	private String planemodelName;
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getPlanemodelName() {
		return planemodelName;
	}

	public void setPlanemodelName(String planemodelName) {
		this.planemodelName = planemodelName;
	}

	@Override
	public String toString() {
		return "CnamePname [companyName=" + companyName + ", planemodelName=" + planemodelName + "]";
	}
	
}	
