package com.airline.domain;

public class Planemodel {
	private String planemodelName;
	private String fnumber;
	private String bnumber;
	private String enumber;
	public String getPlanemodelName() {
		return planemodelName;
	}
	public void setPlanemodelName(String planemodelName) {
		this.planemodelName = planemodelName;
	}
	public String getFnumber() {
		return fnumber;
	}
	public void setFnumber(String fnumber) {
		this.fnumber = fnumber;
	}
	public String getBnumber() {
		return bnumber;
	}
	public void setBnumber(String bnumber) {
		this.bnumber = bnumber;
	}
	public String getEnumber() {
		return enumber;
	}
	public void setEnumber(String enumber) {
		this.enumber = enumber;
	}
	@Override
	public String toString() {
		return "Planemodel [planemodelName=" + planemodelName + ", fnumber=" + fnumber + ", bnumber=" + bnumber
				+ ", enumber=" + enumber + "]";
	}
}
