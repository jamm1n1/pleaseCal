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
	
		//				String 형변환      맴버로 현변환 해준 loginUser값의 유저 번호를 가져옴
		String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		
		// 상품 등록을 위한 정볼르 parameter값으로 가져옴
		String pId = String.valueOf(request.getParameter("pId"));
		String pPrice = String.valueOf(request.getParameter("pPrice"));
		String amount = String.valueOf(request.getParameter("amount"));

		// 장바구니에 넣으려는 상품 정보를 회원의 장바구니에서 가져옴
		Cart c = new CartService().selectPId(writer, pId);
		
		// 가져온 값의 pId가 1이상이면 그 상품이 있다는 의미이므로
		if(c.getPId() > 0) {
			
			// 수량과 가격을 수정해서 다시 업데이트 해줌.
			int nAmount = c.getPAmount() + Integer.parseInt(amount);
			int nPrice = Integer.parseInt(pPrice) * nAmount;
			
			int result2 = new CartService().PlusAmount(nAmount, writer, pId, nPrice);
		//동일한 상품이 장바구니에 없으면	
		}else {
		// 가져온 입력 값으로 상품 등록을 해줌.
		int result = new CartService().insertProduct(writer, amount,  pPrice, pId);

		};
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
