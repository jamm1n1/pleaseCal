package com.uni.order.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cart.model.service.CartService;
import com.uni.order.model.service.OrdertService;
import com.uni.order.model.vo.Order;

/**
 * Servlet implementation class ProductInOrderServlet
 */
@WebServlet("/productInOrder.do")
public class ProductInOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 결제 성공실패 결과를 받아옴
		String rsp = String.valueOf(request.getAttribute("rsp"));
		
		if(rsp.equals("true")) {
			Order o = (Order)(request.getAttribute("o"));
			
			Date d = new Date();
			
			String dDate = String.valueOf(d);
			
			// 결제 결과가 성공이면
			
			// 가져온 상품 객체를 Dao에 보내서 DB에 입력
			int result2 = new OrdertService().insertOrder(o);
			// 성공 메시지를 페이지에 뿌려줌
			String msg = "결제가 성공적으로 완료되었습니다. <br> 도착 예정시간은 약 " + dDate + "일 입니다.";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("views/cart/paymentResult.jsp").forward(request, response);
			
		}else {
			// 실패시 실패 메시지를 뿌려줌
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
