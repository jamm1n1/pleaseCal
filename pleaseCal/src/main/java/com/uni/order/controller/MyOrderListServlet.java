package com.uni.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.vo.Member;
import com.uni.order.model.service.OrdertService;
import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class MyOrderListServlet
 */
@WebServlet("/myOrderList.do")
public class MyOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
		ArrayList<Order> list = new ArrayList<>();
		// 유저 정보를 가져옴
		Member user = ((Member)request.getSession().getAttribute("loginUser"));
		// 가져온 유저정보의 유저번호를 뽑아옴
		int uNo = user.getUserNo();
		// 주문 테이블에 있는 상품 정보를 가져옴
		list = new OrdertService().selectOrderList(uNo);
		// 가져온 유저정보와 상품 목록을 페이지에 넘겨줌
		request.setAttribute("uNo", uNo);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/order/myOrderList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
