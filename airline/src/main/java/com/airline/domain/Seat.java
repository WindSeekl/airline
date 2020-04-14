package com.airline.domain;

public class Seat {
	private String airno;//航空号
	private String aircraftcabin;//舱位
	private String poll;//票数
	private String ticket;//票价
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
		return "Seat [airno=" + airno + ", aircraftcabin=" + aircraftcabin + ", poll=" + poll + ", ticket=" + ticket
				+ "]";
	}
	
}
