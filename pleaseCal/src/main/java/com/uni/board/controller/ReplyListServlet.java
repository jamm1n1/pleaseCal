package com.uni.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.uni.board.model.service.BoardService;
import com.uni.board.model.vo.Reply;

/**
 * Servlet implementation class ReplyListServlet
 */
@WebServlet("/replyList.do")
public class ReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 게시글 번호 조회
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// 댓글 여러 개일 수 있기 때문에 ArrayList에 담기
		ArrayList<Reply> list = new BoardService().selectRList(bno);
		
		// json 타입으로 응답할 것이다
		response.setContentType("application/json; charset=utf-8");
		// 댓글 createDate 날짜 형식 지정
		Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create();
		// jsp로 넘기기
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
