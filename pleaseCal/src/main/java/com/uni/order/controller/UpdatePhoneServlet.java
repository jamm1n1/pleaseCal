package com.uni.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.vo.Member;
import com.uni.order.model.service.OrdertService;

/**
 * Servlet implementation class UpdatePhoneServlet
 */
@WebServlet("/updatePhone.do")
public class UpdatePhoneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePhoneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력한 전화번호
		String phone = String.valueOf(request.getParameter("phone"));

		String userNo = String.valueOf(((Member)request.getSession().getAttribute("loginUser")).getUserNo());
		// 회원 번호와 새로운 휴대번호를 업데이트 해줌
		int result = new OrdertService().updatePhone(phone, userNo);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
