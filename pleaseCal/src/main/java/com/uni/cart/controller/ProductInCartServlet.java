package com.uni.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.cart.model.service.CartService;
import com.uni.cart.model.vo.Cart;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class ProductInCartServlet
 */
@WebServlet("/productInCart.do")
public class ProductInCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		String pId = String.valueOf(request.getParameter("pId"));
		String pPrice = String.valueOf(request.getParameter("pPrice"));
		String amount = String.valueOf(request.getParameter("amount"));

		System.out.println(writer + pId + pPrice + amount);
		int result = new CartService().insertProduct(writer, amount,  pPrice, pId);
		
		System.out.println("insert 결과 : " + result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
