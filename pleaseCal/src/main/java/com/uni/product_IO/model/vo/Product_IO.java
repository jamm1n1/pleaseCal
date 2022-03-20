package com.uni.product_IO.model.vo;

public class Product_IO {

	private int pId;
	private String pName;
	private int pnum;
	
	public Product_IO(int pnum) {
		super();
		this.pnum = pnum;
	}
	
	public Product_IO(int pId, String pName, int pnum) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pnum = pnum;
	}

	public Product_IO(int pId, int pnum) {
		super();
		this.pId = pId;
		this.pnum = pnum;
	}

	public Product_IO() {
		// TODO Auto-generated constructor stub
	}

	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	
}
