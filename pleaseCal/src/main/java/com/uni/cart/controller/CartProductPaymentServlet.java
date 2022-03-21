package com.uni.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cart.model.service.CartService;
import com.uni.cart.model.vo.Cart;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class ProductPaymentServlet
 */
@WebServlet("/productPayment.do")
public class CartProductPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartProductPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());

		Cart c = new CartService().CartList(writer);
		Member m = new CartService().MemberInfo(writer);
		
	
		request.setAttribute("c", c);
		request.setAttribute("m", m);

		System.out.println("m : " + m.getUserName());
		request.getRequestDispatcher("views/cart/productPayment.jsp").forward(request, response);
		
		
		//int q = Integer.parseInt(request.getParameter("q"));
		//System.out.println("Servlet q : " + q);
		//System.out.println(d.dPrice);
		//System.out.println("servlet c.getPPrice : " + c.getPPrice());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
