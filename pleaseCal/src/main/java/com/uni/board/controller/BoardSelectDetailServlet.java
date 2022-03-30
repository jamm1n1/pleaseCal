package com.uni.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.board.model.service.BoardService;
import com.uni.board.model.vo.Attachment;
import com.uni.board.model.vo.Board;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class BoardDetailServlet
 */
@WebServlet("/boardSelectDetail.do")
public class BoardSelectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 게시글 번호 가져와서 형변환
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// 게시글 번호로 해당 게시글 가져오기
		Board b = new BoardService().selectBoard(bno);

		
		// 게시글 번호로 첨부파일 가져오기
		Attachment at = new BoardService().selectAttachment(bno);
		
		// 첨부파일은 없을 수도 있으니까 게시글이 null인지 아닌지만 판단하자
		if(b != null) {
			
			// 비어있지 않으면 jsp로 게시글, 첨부파일 넘김
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			
			request.getRequestDispatcher("views/board/boardSelectDetailView.jsp").forward(request, response);
			
			
		} else {
			// 에러메시지 jsp로 전달 - menubar 를 include 해서 가능
			request.setAttribute("msg", "게시글 조회 실패");
			// 에러페이지
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
