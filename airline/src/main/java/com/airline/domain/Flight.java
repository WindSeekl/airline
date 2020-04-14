package com.airline.domain;

public class Flight {
	private String beginsite;//起始地
	private String endsite;//抵达地
	private String jtime;//航班日期
	private String airine;//航空公司
	private String airno;//航空号
	private Seat state;//舱位
	
	public Seat getState() {
		return state;
	}
	public void setState(Seat state) {
		this.state = state;
	}
	public String getBeginsite() {
		return beginsite;
	}
	public void setBeginsite(String beginsite) {
		this.beginsite = beginsite;
	}
	public String getEndsite() {
		return endsite;
	}
	public void setEndsite(String endsite) {
		this.endsite = endsite;
	}
	public String getJtime() {
		return jtime;
	}
	public void setJtime(String jtime) {
		this.jtime = jtime;
	}
	public String getAirine() {
		return airine;
	}
	public void setAirine(String airine) {
		this.airine = airine;
	}
	public String getAirno() {
		return airno;
	}
	public void setAirno(String airno) {
		this.airno = airno;
	}
	@Override
	public String toString() {
		return "Flight [beginsite=" + beginsite + ", endsite=" + endsite + ", jtime=" + jtime + ", airine=" + airine
				+ ", airno=" + airno + ", state=" + state + "]";
	}
	
	
}
