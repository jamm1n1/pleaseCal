package com.uni.cart.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.cart.model.service.CartService;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/deleteCartProduct.do")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//			 String 형변환      맴버로 현변환 해준 loginUser값의 유저 번호를 가져옴
		String uNo = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		
		// 파라미터로 상품id값을 parameter형태로 받아옴. 받아올 자료형으로 형변환 필수(Integer)
		int pId = Integer.parseInt(request.getParameter("pId"));
		
		// 상품 정보를 장바구니에서 삭제할 쿼리문 실행 후 결과값 받아옴
		int result = new CartService().deleteProduct(uNo, pId);
		
		// 상품 정보를 정상적으로 삭제하면
		if(result == 1) {
			// 다시 장바구니를 호출해서 상품이 정상적으로 사라짐
			response.sendRedirect("cartList.do");
			
		}else {
			 // 상품 삭제에 실패하면 메시지를 뿌려주면서 에러 페이지로 이동
			 request.setAttribute("msg", "장바구니 상품 삭제에 실패하였습니다.");
				
			 request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,response);
			
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
