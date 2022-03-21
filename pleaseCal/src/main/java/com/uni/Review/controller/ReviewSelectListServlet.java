package com.uni.Review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.Review.model.service.ReviewService;
import com.uni.Review.model.vo.Review;

/**
 * Servlet implementation class ReviewSelectListServlet
 */
@WebServlet("/selcetReviewList.do")
public class ReviewSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		
		int plusId;
		int plusId2;
		if(pId == 1) {
			plusId = 2;
			plusId2 = 3;
		} else if (pId == 4) {
			plusId = 5;
			plusId2 = 6;
		} else if (pId == 7) {
			plusId = 8;
			plusId2 = 9;
		} else {
			plusId = 0;
			plusId2 = 0;
		} 
		
		ArrayList<Review> list = new ReviewService().selectReviewList(pId, plusId, plusId2);
		
		if(list != null) {
			request.setAttribute("list", list);
			response.setContentType("application/json; charset=utf-8"); 
			new Gson().toJson(list, response.getWriter());
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
