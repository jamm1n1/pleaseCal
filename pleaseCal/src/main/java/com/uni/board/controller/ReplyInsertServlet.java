package com.uni.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.board.model.service.BoardService;
import com.uni.board.model.vo.Reply;

/**
 * Servlet implementation class ReplyInsertServlet
 */
@WebServlet("/replyInsert.do")
public class ReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// jsp 에서 보낸 데이터 가져오기
		// 참조 게시글 번호
		int bno = Integer.parseInt(request.getParameter("bno"));
		// 댓글 내용
		String content = request.getParameter("content");
		
		// 기본생성자 사용해서 set으로 설정
		Reply re = new Reply();
		re.setReplyContent(content);
		re.setRefBoardNo(bno);
		
		// 댓글 넘겨서 받은 결과 result에 담기
		int result = new BoardService().insertReply(re);
		
		// 잘 등록이 됐으면
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
