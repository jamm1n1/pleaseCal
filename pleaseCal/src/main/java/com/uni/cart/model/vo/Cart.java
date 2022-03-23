package com.uni.cart.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Cart {

	private int cartNo;
	private int userNo;
	private int pAmount;
	private int pPrice;
	private int poPrice;
	private int pId;
	private String pName;
	private String piName;
	private Date dDate;
	private String dRequest;
	public final static int dPrice = 2500;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	// insertCart에 쓰일 생성자
	public Cart(int cartNo, int userNo, int pAmount, int pPrice, int pId) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.pAmount = pAmount;
		this.pPrice = pPrice;
		this.pId = pId;
	}
	
	// insertOrder에 쓰일 생성자
	public Cart(int userNo, int cartNo,int pAmount, int pPrice, Date dDate, String dRequest) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.pAmount = pAmount;
		this.pPrice = pPrice;
		this.dDate = dDate;
		this.dRequest = dRequest;
		}
	
	// selectCart에 쓰일 생성자
	public Cart(int cartNo, int pId, String piName, int poPrice, int pPrice, int pAmount, String pName, Date dDate) {
		super();
		this.cartNo = cartNo;
		this.pId = pId;
		this.piName = piName;
		this.poPrice = poPrice;
		this.pPrice = pPrice;
		this.pAmount = pAmount;
		this.pName = pName;
		this.dDate = dDate;
		
	}
	
}
