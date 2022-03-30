package com.uni.Review.model.vo;

import java.sql.Date;
 
public class Review {
	
	private int rId;
	private int orderNo;
	private int pId;
	private String rName;
	private String rContent;
	private Date rUpdate;
	private String piName;
	private String pName;
	private int userNo;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}
	
	public Review(int orderNo) {
		this.orderNo = orderNo;
	}
	
	public Review(int orderNo, int userNo, int pId) {
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.pId = pId;
	}
	
	public Review(int orderNo, int pId, String rName, String rContent) {
		this(orderNo);
		this.pId = pId;
		this.rName = rName;
		this.rContent = rContent;
		
	}
	
	public Review(int orderNo, int pId, String rName, String rContent, int userNo) {
		this(orderNo);
		this.pId = pId;
		this.rName = rName;
		this.rContent = rContent;
		this.userNo = userNo;
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
	
	public String getPiName() {
		return piName;
	}

	public void setPiName(String piName) {
		this.piName = piName;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}
	
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "Review [rId=" + rId + ", orderNo=" + orderNo + ", pId=" + pId + ", rName=" + rName + ", rContent="
				+ rContent + ", rUpdate=" + rUpdate + ", piName=" + piName + ", pName=" + pName + "]";
	}

	

	
	
	
}
