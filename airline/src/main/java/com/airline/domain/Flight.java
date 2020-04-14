package com.airline.domain;

public class Flight {
	private String beginSite;//起始地
	private String endSite;//抵达地
	private String jTime;//航班日期
	private String airline;//航空公司
	private String airNo;//航空号
	private Seat state;//舱位
	
	public String getBeginSite() {
		return beginSite;
	}
	public void setBeginSite(String beginSite) {
		this.beginSite = beginSite;
	}
	public String getEndSite() {
		return endSite;
	}
	public void setEndSite(String endSite) {
		this.endSite = endSite;
	}
	public Seat getState() {
		return state;
	}
	public void setState(Seat state) {
		this.state = state;
	}
	
	public String getjTime() {
		return jTime;
	}
	public void setjTime(String jTime) {
		this.jTime = jTime;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getAirNo() {
		return airNo;
	}
	public void setAirNo(String airNo) {
		this.airNo = airNo;
	}
	@Override
	public String toString() {
		return "Flight [beginSite=" + beginSite + ", endSite=" + endSite + ", jTime=" + jTime + ", airline=" + airline
				+ ", airNo=" + airNo + ", state=" + state + "]";
	}
}
