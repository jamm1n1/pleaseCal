package com.uni.coupon.model.vo;

public class Coupon {

	
	private int cid;
	private int csale;
	private String cname;
	
	
	
	
	
	 
	public Coupon(int cid, int csale, String cname) {
		super();
		this.cid = cid;
		this.csale = csale;
		this.cname = cname;
	}

	public Coupon(int csale, String cname) {
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
	public int getCsale() {
		return csale;
	}
	public void setCsale(int csale) {
		this.csale = csale;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}

	
	
}

