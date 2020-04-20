package com.airline.domain;

public class ScheduleInfo {
	private int flightscheduleId;
	private String flightNo;
	public int getFlightscheduleId() {
		return flightscheduleId;
	}
	public void setFlightscheduleId(int flightscheduleId) {
		this.flightscheduleId = flightscheduleId;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
	@Override
	public String toString() {
		return "ScheduleInfo [flightscheduleId=" + flightscheduleId + ", flightNo=" + flightNo + "]";
	}
}
