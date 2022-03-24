package com.uni.Review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.Review.model.service.ReviewService;
import com.uni.Review.model.vo.Review;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/reviewdelete.do")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = m.getUserNo();
		int orderNo = Integer.parseInt(request.getParameter("orderNo"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		
		Review r = new Review(orderNo, userNo, pId);
		
		int result = new ReviewService().deleteReview(r);
		
		if(result > 0) {
			response.sendRedirect("myReviewForm.do");
		} else {
			request.setAttribute("msg", "후기삭제실패");
			request.getRequestDispatcher("views/review/myReviewList.jsp");
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
