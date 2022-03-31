package com.uni.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.cart.model.service.CartService;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class PaymentMemberSelectServlet
 */
@WebServlet("/paymentMember.do")
public class PaymentMemberSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentMemberSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		Member m = new CartService().MemberInfo(writer);
		int totPrice = Integer.parseInt(request.getParameter("total0"));
		
		
		request.setAttribute("totPrice", totPrice);
		//System.out.println("totPrice" + totPrice);
		request.setAttribute("m", m);
		
		//new Gson().object(m, response.getWriter());
		//System.out.println("servlet m  : " + m);
		request.getRequestDispatcher("views/cart/productPayment.jsp").forward(request, response);
		//response.sendRedirect("orderProductList.do");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
