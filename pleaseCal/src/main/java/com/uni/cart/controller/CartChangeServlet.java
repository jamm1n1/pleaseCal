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
import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.Product;

/**
 * Servlet implementation class CartChangeServlet
 */
@WebServlet("/amountChange.do")
public class CartChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//              String 형변환      맴버로 현변환 해준 loginUser값의 유저 번호를 가져옴
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		
		int q = Integer.parseInt(request.getParameter("q"));
		int p = Integer.parseInt(request.getParameter("p"));
		String name = request.getParameter("name");

		int result = new CartService().changeAmount(q, name, writer, p);
		
		//수량을 변경해준 다음 다시 장바구니를 호출한다.
		response.sendRedirect("cartList.do");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
