package com.uni.order.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {
	
	private int orderNo;
	private int userNo;
	private Date orderDate;
	private String deliveryRequest;
	private int pId;
	private int pPrice;
	private int pAmount;
	private String piName;
	private String pName;
	private String dState;
	private int cartNo;
	private int orderTOTAmount;
	private int orderTOTPrice;
	
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public Order(int orderNo, int userNo, int cartN, int totP, int totA, String dRequest) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.cartNo = cartN;
		this.orderTOTAmount = totA;
		this.orderTOTPrice = totP;
		this.deliveryRequest = dRequest;
	}

	//insertOrder
	public Order(int orderNo, int userNo, int cartNo, int orderTOTAmount, int orderTOTPrice, Date orderDate,
			String deliveryRequest) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.cartNo = cartNo;
		this.orderTOTAmount = orderTOTAmount;
		this.orderTOTPrice = orderTOTPrice;
		this.deliveryRequest = deliveryRequest;
	}

	//selectOrder
	public Order(int orderNo, int userNo, Date orderDate, String deliveryRequest, int pId, int pAmount, int pPrice,  String piName, String pName, String dState) {
		super();
		this.orderNo = orderNo;
		this.userNo = userNo;
		this.orderDate = orderDate;
		this.deliveryRequest = deliveryRequest;
		this.pId = pId;
		this.pAmount = pAmount;
		this.pPrice = pPrice;
		this.piName = piName;
		this.piName = pName;
		this.dState = dState;
	}
	
	
	
	
}
