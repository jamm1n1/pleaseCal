package com.uni.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.service.BoardService;



/**
 * Servlet implementation class ReplyDeleteServlet
 */
@WebServlet("/replyDelete.do")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 댓글 번호 가져오기
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		System.out.println("rNo === servlet === " + rno);
		
		int result = new BoardService().deleteReply(rno);
		
		// 삭제가 잘 됐으면
		if(result > 0) {
			response.getWriter().print("success"); // success 문자열 넘기기
		} else {
			response.getWriter().print("fail"); // fail 문자열 넘기기
		}
		
		// getWriter() 메소드 이용 시 필수
		response.getWriter().flush();
		response.getWriter().close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
