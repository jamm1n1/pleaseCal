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
 * Servlet implementation class ReviewInserServlet
 */
@WebServlet("/reviewInsert.do")
public class ReviewInserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		int userNo = m.getUserNo();
		int pId = Integer.parseInt(request.getParameter("pId"));
		int oId = Integer.parseInt(request.getParameter("oId"));
		String rName = request.getParameter("title");
		String rContent = request.getParameter("content");
		
		Review r = new Review(oId, pId, rName, rContent, userNo);
		
		int result = new ReviewService().insertReview(r); 
		String num = String.valueOf(oId) + String.valueOf(pId);
		
		
		if(result > 0) {
			response.sendRedirect("myOrderList.do");
		} else {
			response.sendRedirect("myOrderList.do");
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
