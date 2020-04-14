package com.airline.domain;

public class Flight {
	private String beginsite;//起始地
	private String endsite;//抵达地
	private String jtime;//航班日期
	private String airine;//航空公司
	private String airno;//航空号
	private String aircraftcabin;//舱位
	private String poll;//票数
	private String ticket;//票价
	
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
	public String getAircraftcabin() {
		return aircraftcabin;
	}
	public void setAircraftcabin(String aircraftcabin) {
		this.aircraftcabin = aircraftcabin;
	}
	public String getPoll() {
		return poll;
	}
	public void setPoll(String poll) {
		this.poll = poll;
	}
	public String getTicket() {
		return ticket;
	}
	public void setTicket(String ticket) {
		this.ticket = ticket;
	}
	@Override
	public String toString() {
		return "Flight [beginsite=" + beginsite + ", endsite=" + endsite + ", jtime=" + jtime + ", airine=" + airine
				+ ", airno=" + airno + ", aircraftcabin=" + aircraftcabin + ", poll=" + poll + ", ticket=" + ticket
				+ "]";
	}
	
}
