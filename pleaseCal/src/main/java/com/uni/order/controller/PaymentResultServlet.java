package com.uni.order.controller;

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
		
		// 결제 성공실패 결과를 parameter로가져옴
		String rsp = request.getParameter("re");
		
		if(rsp.equals("true")) {
		
			//				String 형변환      맴버로 현변환 해준 loginUser값의 유저 번호를 가져옴
			String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			
		
			// 배송메시지를 parameter로 받아옴
			String dRequest = request.getParameter("dRequest");
			
			ArrayList<Cart> list = new CartService().CartList(writer);
			
			int totP = 2500;      // 상품의 금액을 더하기 전에 배송비를 기본값으로 설정
			int totA = 0;         // 상품의 총 금액을 담아줄 변수
			int cartN = 0;		  // 장바구니 번호를 담을 변수
			Date d = new Date();  // 상품 배송날자를 받아줄 변수
			
			// 반복문을 돌리면서 list안의 값들을 누적해서 변수에 담아줌
			for(int i = 0; i < list.size(); i++) {
				
				totP += list.get(i).getPPrice();
				totA += list.get(i).getPAmount();
				cartN = list.get(0).getCartNo();
				d = list.get(0).getDDate();
			}
			
			// 주문한 시간으로 주문번호를 만들어줌 
			long orderNumber = new Date().getTime();
			
			// long형의 현제시간을 잘라서 6개만 표시 
			String orderN = String.valueOf(orderNumber).substring(7);
			
			// String 형태의 변수를 int형으로 변환해줌
			int orderNo = Integer.parseInt(orderN);
			int userNo = Integer.parseInt(writer);
					
			
			// 주문내역에 넣을 객체에 각 변수들을 담아줌
			Order o = new Order(orderNo, userNo, cartN, totP, totA, dRequest);
			String dDate = String.valueOf(d);
				
				
			new CartService().updateCart(writer);
			new OrdertService().insertOrder(o);
			
			// 결제가 완료되면 완료 메시지와 함께 페이지를 이동함
			String msg = "결제가 성공적으로 완료되었습니다. <br> 도착 예정시간은 약 " + dDate + "일 입니다.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("views/cart/paymentResult.jsp").forward(request, response);
			
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
