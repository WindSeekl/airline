package com.airline.domain;

public class Company {
	private int companyId;
	private String companyName;
	private String companyCode;
	private String companyInfo;
	private String companyUrl;
	private String companyPhone;
	private Double copper;
	private Double silver;
	private Double gold;
	
	public Double getCopper() {
		return copper;
	}
	public void setCopper(Double copper) {
		this.copper = copper;
	}
	public Double getSilver() {
		return silver;
	}
	public void setSilver(Double silver) {
		this.silver = silver;
	}
	public Double getGold() {
		return gold;
	}
	public void setGold(Double gold) {
		this.gold = gold;
	}
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}
	public String getCompanyUrl() {
		return companyUrl;
	}
	public void setCompanyUrl(String companyUrl) {
		this.companyUrl = companyUrl;
	}
	public String getCompanyPhone() {
		return companyPhone;
	}
	public void setCompanyPhone(String companyPhone) {
		this.companyPhone = companyPhone;
	}
	
	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyName=" + companyName + ", companyCode=" + companyCode
				+ ", companyInfo=" + companyInfo + ", companyUrl=" + companyUrl + ", companyPhone=" + companyPhone
				+ ", copper=" + copper + ", silver=" + silver + ", gold=" + gold + "]";
	}
	
	
}
