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
		
		String rsp = request.getParameter("re");
		
		if(rsp.equals("true")) {
			
			//				String 형변환      맴버로 현변환 해준 loginUser값의 유저 번호를 가져옴
			String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			// 상품 한 개의 결제 결과와 상품 결제 정보를 받아옴
			
			String dRequest = request.getParameter("dRequest");
			int pAmount = Integer.parseInt(request.getParameter("pPrice"));		
			int tot = Integer.parseInt(request.getParameter("pAmount"));
			
			String pA = request.getParameter("pAmount");
			String pP = request.getParameter("pPrice");
			String pId = request.getParameter("pId");
			// 주문내역에서 조회를 하려면 카트에 상품이 등록되어 있어야 하기 때문에 카트에 상태값이 'Y'인 채로 상품을 등록해줌
			int result3 = new CartService().insertSelectProduct(writer, pA,  pP, pId); 
			
			// 상품 등록이 성공했다면
			if(result3 == 1) {
				// 주문번호를 생성하여 주문 테이블로 옮길 객체를 만들어줌
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
		}else {
			// 결제가 완료되면 완료 메시지와 함께 페이지를 이동함
			String msg = "결제에 실패하였습니다.";
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
