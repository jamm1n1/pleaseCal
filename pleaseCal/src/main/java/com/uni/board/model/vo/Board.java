package com.uni.board.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {

	private int boardNo;
	private String boardWriter;
	private String category;
	private String boardContent;
	private String boardSecret;
	private String boardPwd;
	private int count;
	private Date createDate;
	private String status;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	
	// selectList 위한 생성자
	public Board(int boardNo, String boardWriter, String category, int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.category = category;
		this.count = count;
		this.createDate = createDate;
	}

	// selectBoard 위한 생성자
	public Board(int boardNo, String boardWriter, String category, String boardContent, String boardSecret,
			String boardPwd, int count, Date createDate) {
		super();
		this.boardNo = boardNo;
		this.boardWriter = boardWriter;
		this.category = category;
		this.boardContent = boardContent;
		this.boardSecret = boardSecret;
		this.boardPwd = boardPwd;
		this.count = count;
		this.createDate = createDate;
	}
	
	
	




}
