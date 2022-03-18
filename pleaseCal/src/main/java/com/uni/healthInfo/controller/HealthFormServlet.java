package com.uni.healthInfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.healthInfo.model.service.HealthInfoService;
import com.uni.healthInfo.model.vo.HealthInfo;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class HealthFormServlet
 */
@WebServlet("/healthInfo.do")
public class HealthFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 건강계산기 창 들어가기전 로그인유저의 정보 받음
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		// 회원인경우 회원번호 받음, 비회원인경우 0 으로 반환
		int userNo = 0;
		if(loginUser != null) {
			userNo = loginUser.getUserNo(); 	
			// 회원일때 기존 저장정보가 있는지
			HealthInfo h = new HealthInfoService().selectHealth(userNo);
			if(h != null) {
				request.setAttribute("check", "Y");
			} else {
				request.setAttribute("check", "N");
			}
		} 
		
		request.setAttribute("userNo", userNo);
		request.getRequestDispatcher("views/healthInfo/calculator.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
