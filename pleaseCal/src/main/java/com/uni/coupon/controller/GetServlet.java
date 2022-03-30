package com.uni.coupon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.coupon.model.service.CouponService;
import com.uni.coupon.model.vo.MemberCoupon;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class GetServlet
 */
@WebServlet("/get.do")
public class GetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userno = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();//세션에서 회원번호를 가져옴
		int cid = Integer.parseInt(request.getParameter("cid")) ;
		System.out.println(cid);
		MemberCoupon c = new CouponService().get(userno,cid);
		response.sendRedirect(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
