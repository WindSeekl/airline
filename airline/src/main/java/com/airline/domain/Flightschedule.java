package com.airline.domain;

public class Flightschedule {
	private int flightscheduleId;
	private String beginSite;
	private String endSite;
	private String fsDate;

	public String getEndSite() {
		return endSite;
	}

	public void setEndSite(String endSite) {
		this.endSite = endSite;
	}

	public String getFsDate() {
		return fsDate;
	}

	public void setFsDate(String fsDate) {
		this.fsDate = fsDate;
	}

	public String getBeginSite() {
		return beginSite;
	}

	public void setBeginSite(String beginSite) {
		this.beginSite = beginSite;
	}

	public int getFlightscheduleId() {
		return flightscheduleId;
	}

	public void setFlightscheduleId(int flightscheduleId) {
		this.flightscheduleId = flightscheduleId;
	}

	@Override
	public String toString() {
		return "Flightschedule [flightscheduleId=" + flightscheduleId + ", beginSite=" + beginSite + ", endSite="
				+ endSite + ", fsDate=" + fsDate + "]";
	}
	
}
