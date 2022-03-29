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
 * Servlet implementation class ProductDetailPaymentServlet
 */
@WebServlet("/productDetailPayment.do")
public class ProductDetailPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailPaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		Member m = new CartService().MemberInfo(writer);
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		int pQ = Integer.parseInt(request.getParameter("numBox"));
		int poPrice =  Integer.parseInt(request.getParameter("pPrice"));
		
		Cart c = new CartService().selectDetailProduct(pId);
		int pPrice = poPrice * pQ;
		
		request.setAttribute("c", c);
		request.setAttribute("pPrice", pPrice);
		request.setAttribute("pQ", pQ);
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("views/order/selectProductPayment.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
