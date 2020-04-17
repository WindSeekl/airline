package com.airline.domain;

public class Reserve {
	private String reserveId;//订单号
	private String cardId;//乘客身份证号
	private String userName;//乘客姓名
	private String flightId;//航班号
	private String benginDate;//出发时间
	private String endDate;//到达时间
	private String benginSite;//出发地点
	private String endSite;//到达地点
	private String seatId;//座位号
	private String money;//票价
	private String travelDate;//里程时间
	private String state;//订单状态
	private String customerName;//登录用户名
	private String orderDate;//下单时间
	private String phoneNum;//手机号
	
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getReserveId() {
		return reserveId;
	}
	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFlightId() {
		return flightId;
	}
	public void setFlightId(String flightId) {
		this.flightId = flightId;
	}
	public String getBenginDate() {
		return benginDate;
	}
	public void setBenginDate(String benginDate) {
		this.benginDate = benginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getBenginSite() {
		return benginSite;
	}
	public void setBenginSite(String benginSite) {
		this.benginSite = benginSite;
	}
	public String getEndSite() {
		return endSite;
	}
	public void setEndSite(String endSite) {
		this.endSite = endSite;
	}
	public String getSeatId() {
		return seatId;
	}
	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getTravelDate() {
		return travelDate;
	}
	public void setTravelDate(String travelDate) {
		this.travelDate = travelDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Reserve [reserveId=" + reserveId + ", cardId=" + cardId + ", userName=" + userName + ", flightId="
				+ flightId + ", benginDate=" + benginDate + ", endDate=" + endDate + ", benginSite=" + benginSite
				+ ", endSite=" + endSite + ", seatId=" + seatId + ", money=" + money + ", travelDate=" + travelDate
				+ ", state=" + state + ", customerName=" + customerName + ", orderDate=" + orderDate + ", phoneNum="
				+ phoneNum + "]";
	}
	
}

