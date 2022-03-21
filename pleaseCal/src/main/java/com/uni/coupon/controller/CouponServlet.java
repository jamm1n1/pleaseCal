package com.uni.coupon.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.uni.coupon.model.service.CouponService;
import com.uni.coupon.model.vo.Coupon;
import com.uni.member.model.vo.Member;


/**
 * Servlet implementation class CouponServlet
 */
@WebServlet("/coupon.do")
public class CouponServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int userno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
	
		
			ArrayList<Coupon> list = new CouponService().selectcoupon(userno);
			request.setAttribute("list", list);					
		    RequestDispatcher view = request.getRequestDispatcher("views/member/coupon.jsp");
		    view.forward(request, response);
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
