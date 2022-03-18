package com.uni.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.notice.model.service.NoticeService;
import com.uni.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/noticeUpdate.do")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//request.setCharacterEncoding("UTF-8");
		
		// 수젇한 제목, 내용, 게시글 번호 가져와서 객체에 담기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 게시글 번호 가져오기
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		// 해당 번호 게시글 가져와서 담기
		Notice notice = new NoticeService().selectNotice(nno);
		
		// set 으로 수정
		notice.setNoticeTitle(title);
		notice.setNoticeContent(content.replaceAll("\n", "<br>"));
		
		// 업데이트 위해 객체 넘기고 결과 int로 받기
		int result = new NoticeService().updateNotice(notice);
		
		// 업데이트 잘 되었으면
		if(result > 0) {
			// 메시지 띄우기
			request.setAttribute("msg", "공지사항 수정 성공");
			// 상세 페이지로 이동
			response.sendRedirect("noticeDetail.do?nno=" + nno);
		} else {
			// 에러 메시지 띄우기
			request.setAttribute("msg", "공지사항 수정 실패");
			// 공지사항 리스트 페이지로 이동
			request.getRequestDispatcher("views/notice/noticeList.jsp");
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
