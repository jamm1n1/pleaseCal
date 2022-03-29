package com.uni.cart.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
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
 * Servlet implementation class PaymentResultServlet
 */
@WebServlet("/paymentResult.do")
public class PaymentResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentResultServlet() {
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
		
		ArrayList<Cart> list = new CartService().CartList(writer);
		
		long orderNumber = new Date().getTime();
		String orderN = String.valueOf(orderNumber).substring(7);
		int orderNo = Integer.parseInt(orderN);
		int userNo = Integer.parseInt(writer);
		Date d = new Date();
		
		
		int totP = 2500;
		int totA = 0;
		int cartN = 0;
		
		for(int i = 0; i < list.size(); i++) {
			
			totP += list.get(i).getPPrice();
			totA += list.get(i).getPAmount();
			cartN = list.get(0).getCartNo();
			d = list.get(0).getDDate();
		}
		Order o = new Order(orderNo, userNo, cartN, totP, totA, dRequest);
		String dDate = String.valueOf(d);

		if(rsp.equals("true")) {
			
		int result = new CartService().updateCart(writer);
		int result2 = new OrdertService().insertOrder(o);

		String msg = "결제가 성공적으로 완료되었습니다. <br> 도착 예정시간은 약 " + dDate + "일 입니다.";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("views/cart/paymentResult.jsp").forward(request, response);
			
		}else {
		
		response.sendRedirect("cartList.do");
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
