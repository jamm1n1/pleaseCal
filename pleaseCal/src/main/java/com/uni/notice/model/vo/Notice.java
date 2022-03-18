package com.uni.notice.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private int count;
	private Date createDate;
	private String status;
	
	// selectList
	public Notice(int noticeNo, String noticeTitle, String noticeContent, int count, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.count = count;
		this.createDate = createDate;
	}
	
	// insertNotice
	public Notice(String noticeTitle, String noticeContent) {
		super();
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	
	
	
	
	
}
