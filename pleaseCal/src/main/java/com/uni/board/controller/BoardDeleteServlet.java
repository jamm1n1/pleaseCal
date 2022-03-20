package com.uni.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.service.BoardService;
import com.uni.board.model.vo.Attachment;
import com.uni.board.model.vo.Reply;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/boardDelete.do")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 게시글 번호 가져오기
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		/* 트리거 생성으로 필요 없어짐
		// 해당 게시글의 첨부파일 가져오기
		Attachment at = new BoardService().selectAttachment(bno);
		// 해당 게시글의 댓글 리스트 가져오기
		ArrayList<Reply> reList = new BoardService().selectRList(bno);
		
		// 해당 게시글 번호, 첨부파일, 댓글 넘겨서 게시글 삭제한 결과 result로 받기
		int result = new BoardService().deleteBoard(bno, at, reList);
		*/
		
		// 해당 게시글 넘겨 삭제한 결과 result 에 담기
		int result = new BoardService().deleteBoard(bno);
		
		// 삭제가 잘 되었으면
		if(result > 0) {
			// 메시지 띄우기 - menubar를 include 했기 때문에 가능
			request.getSession().setAttribute("msg", "게시글 삭제 성공");
			// 공지사항 메인으로 페이지 이동 - url 변경
			response.sendRedirect("boardList.do");

		} else {
			// 에러메시지
			request.getSession().setAttribute("msg", "게시글 삭제 실패");
			// 에러페이지로 이동 - url 그대로
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
