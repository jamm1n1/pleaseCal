package com.uni.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.cart.model.service.CartService;
import com.uni.cart.model.vo.Cart;
import com.uni.member.model.vo.Member;
import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.Product;

/**
 * Servlet implementation class CartListServlet
 */
@WebServlet("/cartList.")
public class CartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    /*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		//System.out.println("Servlet writer : " + writer);
		ArrayList<Cart> list = new CartService().CartList(writer);
		
		request.setAttribute("list", list);

		
		response.setContentType("application/json; charset=utf-8"); 
		
		new Gson().toJson(list, response.getWriter());

		for(int i = 0; i < list.size(); i++) {
			System.out.println("Servlet list = " + list.get(i).getCartNo());
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("views/cart/cartList.jsp");
		rd.forward(request, response);
		
	}
	*/
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		//System.out.println(String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo()));
		//System.out.println("Servlet writer : " + writer);
		Cart c = new CartService().CartList(writer);
		
		request.setAttribute("c", c);
		//System.out.println("servlet c : " + c);
		//System.out.println("servlet getPAmount : " + c.getPAmount());
		request.getRequestDispatcher("views/cart/cartList.jsp").forward(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
