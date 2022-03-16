package com.uni.product.model.vo;

public class Product {
	
	private int pId;
	private String pName;
	private int pPrice;
	private int pQuantity;
	private int cId;
	private String pKacl;
	private String pCarbo;
	private String pProtin;
	private String pFat;
	private String pNatrium;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Product(int pId, String pName, int pPrice, int pQuantity, int cId, String pKacl, String pCarbo,
			String pProtin, String pFat, String pNatrium) {
		super();
		this.pId = pId;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pQuantity = pQuantity;
		this.cId = cId;
		this.pKacl = pKacl;
		this.pCarbo = pCarbo;
		this.pProtin = pProtin;
		this.pFat = pFat;
		this.pNatrium = pNatrium;
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

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpQuantity() {
		return pQuantity;
	}

	public void setpQuantity(int pQuantity) {
		this.pQuantity = pQuantity;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getpKacl() {
		return pKacl;
	}

	public void setpKacl(String pKacl) {
		this.pKacl = pKacl;
	}

	public String getpCarbo() {
		return pCarbo;
	}

	public void setpCarbo(String pCarbo) {
		this.pCarbo = pCarbo;
	}

	public String getpProtin() {
		return pProtin;
	}

	public void setpProtin(String pProtin) {
		this.pProtin = pProtin;
	}

	public String getpFat() {
		return pFat;
	}

	public void setpFat(String pFat) {
		this.pFat = pFat;
	}

	public String getpNatrium() {
		return pNatrium;
	}

	public void setpNatrium(String pNatrium) {
		this.pNatrium = pNatrium;
	}

	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pName=" + pName + ", pPrice=" + pPrice + ", pQuantity=" + pQuantity + ", cId="
				+ cId + ", pKacl=" + pKacl + ", pCarbo=" + pCarbo + ", pProtin=" + pProtin + ", pFat=" + pFat
				+ ", pNatrium=" + pNatrium + "]";
	}

	
	
	

}
