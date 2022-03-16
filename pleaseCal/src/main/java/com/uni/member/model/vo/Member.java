package com.uni.member.model.vo;

public class Member {

	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String phone;
	private String address;
	private int mileage;
	private int coupon;
	private String status;
	
	
	
	
	public Member() {}
	
	
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	
	    
	
	public Member(int userNo, String userId, String userPwd, String userName, String phone, String address, int milege,
			String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.mileage = milege;
		this.status = status;
	}




	public Member(int userNo, String userId, String userPwd, String userName, String phone, String address, int mileage,
			int coupon, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.phone = phone;
		this.address = address;
		this.mileage = mileage;
		this.coupon = coupon;
		this.status = status;
	}


	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public int getMilege() {
		return mileage;
	}
	public void setMilege(int milege) {
		this.mileage = milege;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", phone=" + phone + ", address=" + address + ", coupon=" + coupon + ", mileage=" + mileage
				+ ", status=" + status + "]";
	}
	
}
