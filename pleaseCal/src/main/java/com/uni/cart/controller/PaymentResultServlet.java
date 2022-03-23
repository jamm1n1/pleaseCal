package com.uni.cart.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String rsp = request.getParameter("re");
		String dDate = request.getParameter("dDate");
		System.out.println("re , dDate : " + rsp);
		
		//SimpleDateFormat
		
		if(rsp.equals("true")) {
			
		String msg = "결제가 성공적으로 완료되었습니다. <br> 도착 예정시간은 약 " + dDate + "일 입니다.";
		System.out.println( msg);
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("views/cart/paymentResult.jsp").forward(request, response);
			
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
