package com.airline.domain;

public class Flight {
	private String flightId;//航班id
	private String flightNo;//航班号
	private String beginSite;//起始地
	private String endSite;//抵达地
	private String beginTime;//起始时间
	private String beginAir;//出发机场
	private String endAir;//到达机场
	private String endTime;//到达时间
	private String fprice;//头等舱价格
	private String bprice;//商务舱价格
	private String eprice;//经济舱价格
	private String companyName;//航空公司
	private String planemodelName;//机型
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
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getBeginAir() {
		return beginAir;
	}
	public void setBeginAir(String beginAir) {
		this.beginAir = beginAir;
	}
	public String getEndAir() {
		return endAir;
	}
	public void setEndAir(String endAir) {
		this.endAir = endAir;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public String getFlightNo() {
		return flightNo;
	}
	public void setFlightNo(String flightNo) {
		this.flightNo = flightNo;
	}
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
	public String getFprice() {
		return fprice;
	}
	public void setFprice(String fprice) {
		this.fprice = fprice;
	}
	public String getBprice() {
		return bprice;
	}
	public void setBprice(String bprice) {
		this.bprice = bprice;
	}
	public String getEprice() {
		return eprice;
	}
	public void setEprice(String eprice) {
		this.eprice = eprice;
	}
	@Override
	public String toString() {
		return "Flight [flightId=" + flightId + ", flightNo=" + flightNo + ", beginSite=" + beginSite + ", endSite="
				+ endSite + ", beginTime=" + beginTime + ", beginAir=" + beginAir + ", endAir=" + endAir + ", endTime="
				+ endTime + ", fprice=" + fprice + ", bprice=" + bprice + ", eprice=" + eprice + ", companyName="
				+ companyName + ", planemodelName=" + planemodelName + "]";
	}
}
