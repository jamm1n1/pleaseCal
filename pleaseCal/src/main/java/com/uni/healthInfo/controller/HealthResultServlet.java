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
 * Servlet implementation class HealthResultServlet
 */
@WebServlet("/calResult.do")
public class HealthResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		int userNo = Integer.parseInt(request.getParameter("no"));  
		System.out.println("회원번호: "+userNo);
		
		int age = Integer.parseInt(request.getParameter("age"));
		char gen = request.getParameter("gen").charAt(0);
		int hei = Integer.parseInt(request.getParameter("cen"));
		int wei = Integer.parseInt(request.getParameter("weight"));
		int active = Integer.parseInt(request.getParameter("loa"));
		
		int result;
		if(userNo != 0 && age != 0 && (gen != 'M' ||  gen != 'F') && hei != 0 && wei != 0 && active != 0) {
			
			HealthInfo h = new HealthInfo(userNo, age, gen, hei, wei, active);
		
			result = new HealthInfoService().InsertHealth(h);
		
		} else {
			result = 0;
		}
		
		if(result > 0) {
			// 저장 성공후 다시 로그인한 회원번호를 받고 입장하기 위한 건강계산기 창 입장 서블릿으로
			response.sendRedirect("healthInfo.do");
		} else {
			request.getRequestDispatcher("views/healthInfo/calsulator.jsp").forward(request, response);
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
