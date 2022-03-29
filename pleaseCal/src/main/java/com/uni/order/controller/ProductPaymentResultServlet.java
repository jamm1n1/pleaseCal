package com.uni.order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cart.model.service.CartService;
import com.uni.cart.model.vo.Cart;
import com.uni.member.model.vo.Member;
import com.uni.order.model.service.OrdertService;
import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class ProductPaymentResultServlet
 */
@WebServlet("/productPaymentResult.do")
public class ProductPaymentResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPaymentResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		String rsp = request.getParameter("re");
		String dRequest = request.getParameter("dRequest");
		int pAmount = Integer.parseInt(request.getParameter("pPrice"));		
		int tot = Integer.parseInt(request.getParameter("pAmount"));
		
		String pA = request.getParameter("pAmount");
		String pP = request.getParameter("pPrice");
		
		
		
		String pId = request.getParameter("pId");
		

		Cart c = new CartService().selectPId(writer, pId);
		//System.out.println("c ===============" + c);

			

		//System.out.println(writer + pId + pPrice + amount);
		
		int result3 = new CartService().insertSelectProduct(writer, pA,  pP, pId); // 카트에 상품정보 집어넣기
		//System.out.println("insert 결과 : " + result);
		
		if(result3 == 1) {
			ArrayList<Cart> list = new CartService().CartList(writer);
			
			long orderNumber = new Date().getTime();
			String orderN = String.valueOf(orderNumber).substring(7);
			int orderNo = Integer.parseInt(orderN);
			int userNo = Integer.parseInt(writer);
			Date d = new Date();
			
			int cartN = 0;
		
			Order o = new Order(orderNo, userNo, cartN, pAmount, tot, dRequest);
			String dDate = String.valueOf(d);
			
			request.setAttribute("rsp", rsp);
			request.setAttribute("o", o);
			request.setAttribute("dDate", dDate);
			request.getRequestDispatcher("productInOrder.do").forward(request, response);
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
