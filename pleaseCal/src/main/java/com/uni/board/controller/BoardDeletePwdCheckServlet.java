package com.uni.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.service.BoardService;
import com.uni.board.model.vo.Attachment;
import com.uni.board.model.vo.Board;

/**
 * Servlet implementation class BoardPwdInsertServlet
 */
@WebServlet("/boardDeletePwdCheck.do")
public class BoardDeletePwdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeletePwdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 게시글 번호 가져와서
		int bno = Integer.parseInt(request.getParameter("bno"));
		// 해당 게시글 가져오기
		Board b = new BoardService().selectOneBoard(bno);
		// 해당 게시글 첨부파일 가져오기
		//Attachment at = new BoardService().selectAttachment(bno);
		
		//System.out.println("board == servlet == " + b);
		
		// 게시글이 있다면
		if(b != null) {
			// 게시글 jsp로 넘기기
			request.setAttribute("b", b);
			
			// 게시글 비밀번호 입력창으로 전환
			request.getRequestDispatcher("views/board/boardDeletePwdCheck.jsp").forward(request, response);
		
		} else {
			// 에러메시지 jsp로 전달 - menubar 를 include 해서 가능
			request.setAttribute("msg", "게시글 삭제 실패");
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
