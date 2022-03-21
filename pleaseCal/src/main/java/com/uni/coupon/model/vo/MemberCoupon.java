package com.uni.coupon.model.vo;

public class MemberCoupon {

	
	private String userId;
	private int cid;
	
	
	
	
	
	public MemberCoupon(String userId, int cid) {
		super();
		this.userId = userId;
		this.cid = cid;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
	
}
