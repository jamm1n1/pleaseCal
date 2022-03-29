package com.uni.coupon.model.vo;

public class Coupon {

	
	private int cid;
	private String csale;
	private String cname;
	
	
	
	
	
	 
	public Coupon(int cid, String csale, String cname) {
		super();
		this.cid = cid;
		this.csale = csale;
		this.cname = cname;
	}

	public Coupon(String csale, String cname) {
		super();
		this.csale = csale;
		this.cname = cname;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCsale() {
		return csale;
	}
	public void setCsale(String csale) {
		this.csale = csale;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}

	
	
}

