package com.uni.product.model.vo;

import lombok.Data;

@Data
public class PInfo {
	
	private int pid;
	private String pKcal;
	private String pCarbo;
	private String pPro;
	private String pFat;
	private String pNat;
	
	public PInfo() {
		// TODO Auto-generated constructor stub
	}

	public PInfo(int pid, String pKcal, String pCarbo, String pPro, String pFat, String pNat) {
		super();
		this.pid = pid;
		this.pKcal = pKcal;
		this.pCarbo = pCarbo;
		this.pPro = pPro;
		this.pFat = pFat;
		this.pNat = pNat;
	}
}
