package com.uni.product.model.vo;

import lombok.Data;

@Data
public class PImg {
	
	private int fileNo;
	private String filePath;
	private int pid;
	private String fName;

	
	public PImg() {
		// TODO Auto-generated constructor stub
	}

	public PImg(int pid, String fName, String filePath) {
		super();
		this.pid = pid;
		this.fName = fName;
		this.filePath = filePath;
	}

}
