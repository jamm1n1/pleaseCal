package com.uni.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/noticeDelete.do")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 삭제할 공지사항 번호 가져오기
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		// 해당 공지사항 게시글 번호 넘겨서 있는지 int로 받아 오기
		int result = new NoticeService().deleteNotice(nno);
		
		// 삭제할 게 있어서 성공하면
		if(result > 0) {
			// 메시지 띄우기
			request.setAttribute("msg", "공지사항 삭제 성공");
			// 공지사항 리스트 화면으로 이동
			response.sendRedirect("noticeList.do");
			
		} else {
			// 에러 메시지 띄우기
			request.setAttribute("msg", "공지사항 삭제 실패");
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
