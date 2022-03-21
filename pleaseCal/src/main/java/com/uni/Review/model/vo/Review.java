package com.uni.Review.model.vo;

import java.util.Date;

public class Review {
	
	private int rId;
	private int orderNo;
	private int pId;
	private String rName;
	private String rContent;
	private Date rUpdate;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	public Review(int orderNo) {
		this.orderNo = orderNo;
	}
	
	public Review(int orderNo, int pId, String rName, String rContent) {
		this(orderNo);
		this.pId = pId;
		this.rName = rName;
		this.rContent = rContent;
		
	}
	
	public Review(int rId, int orderNo, int pId, String rName, String rContent, Date rUpdate) {
		this(orderNo, pId, rName, rContent);
		this.rId = rId;
		this.rUpdate = rUpdate;
	}

	

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrUpdate() {
		return rUpdate;
	}

	public void setrUpdate(Date rUpdate) {
		this.rUpdate = rUpdate;
	}

	@Override
	public String toString() {
		return "Review [rId=" + rId + ", orderNo=" + orderNo + ", pId=" + pId + ", rName=" + rName + ", rContent="
				+ rContent + ", rUpdate=" + rUpdate + "]";
	}
	
	
}
