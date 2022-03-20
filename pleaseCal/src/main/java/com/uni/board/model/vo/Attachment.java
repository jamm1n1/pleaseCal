package com.uni.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Attachment {

	private int fileNo;
	private int refBoardNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
}
