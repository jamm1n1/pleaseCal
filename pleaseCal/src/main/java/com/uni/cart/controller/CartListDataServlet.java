package com.uni.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

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

			
			
			//      		String 형변환      맴버로 현변환 해준 loginUser값의 유저 번호를 가져옴
			String writer = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
			
			// 회원 번호를 이용해 장바구니 안의 상품 목록을 가져옴
			ArrayList<Cart> list = new CartService().CartList(writer);

			//response(응답)객체의 타입을 Json형태로 변경하고 인코딩을 UTF-8로 설정함.
			response.setContentType("application/json; charset=utf-8"); 
		
			// 구글에서 제공하는 오픈소스 Gson라이브러리를 이용해 list를 Json형태로 변경해줌.
			// getwriter를 쓰는 이유는 페이지에 출력된 형태가 텍스트(HTML)이기 때문
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
