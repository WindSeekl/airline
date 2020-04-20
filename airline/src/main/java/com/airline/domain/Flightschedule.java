package com.airline.domain;

public class Flightschedule {
	private int flightschedule;
	private String beginSite;
	private String endSite;
	private String fsDate;
	
	public int getFlightschedule() {
		return flightschedule;
	}

	public void setFlightschedule(int flightschedule) {
		this.flightschedule = flightschedule;
	}

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

	@Override
	public String toString() {
		return "Flightschedule [flightschedule=" + flightschedule + ", beginSite=" + beginSite + ", endSite=" + endSite
				+ ", fsDate=" + fsDate + "]";
	}
}
