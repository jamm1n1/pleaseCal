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
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/noticeSearchDetail.do")
public class NoticeSearchDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearchDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 상세 조회는 객체 하나
		
		// 해당 공지사항 게시글 번호 가져오기
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		// 해당 게시글 가져와서 Notice 에 담기
		Notice notice = new NoticeService().selectNotice(nno);
		
		// 목록으로 클릭 시 반영하기 위해 가져와서 jsp로 보내기
		// condition, search 가져오기
		String condition = request.getParameter("condition");
		String search = request.getParameter("search");

		
		// 공지사항 잘 가져왔으면
		if(notice != null) {
			// 해당 공지사항 게시글 jsp로 전달
			request.setAttribute("notice", notice);
			request.setAttribute("condition", condition);
			request.setAttribute("search", search);			
			// 상세 페이지로 화면 전환
			request.getRequestDispatcher("views/notice/noticeSearchDetailView.jsp").forward(request, response);
		// 실패 시
		} else {
			// 에러 메시지 띄우기
			request.setAttribute("msg", "공지사항 상세조회 실패");
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
