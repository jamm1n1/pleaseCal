package com.uni.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Reply {
	
	private int replyNo;
	private int refBoardNo;
	private String replyContent;
	private Date createDate;
	private String status;
	
	public Reply() {
		// TODO Auto-generated constructor stub
	}
	
	// selectRlist
	public Reply(int replyNo, String replyContent, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.createDate = createDate;
	}
	
	

}
