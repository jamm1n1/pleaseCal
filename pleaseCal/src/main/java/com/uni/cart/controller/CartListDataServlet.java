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
 * Servlet implementation class CartListDataServlet
 */
@WebServlet("/cartListData.do")
public class CartListDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		//System.out.println("Servlet writer : " + writer);
		ArrayList<Cart> list = new CartService().CartList(writer);
		
		request.setAttribute("list", list);

		
		response.setContentType("application/json; charset=utf-8"); 
		System.out.println("list : " + list);
		new Gson().toJson(list, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
