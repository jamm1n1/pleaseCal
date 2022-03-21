package com.uni.healthInfo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.healthInfo.model.service.HealthInfoService;

/**
 * Servlet implementation class HealthInfoDeleteServlet
 */
@WebServlet("/deleteHealthInfo.do")
public class HealthInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthInfoDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 정보 삭제 클릭시 
		int userNo = Integer.parseInt(request.getParameter("no"));  
		
		int result = new HealthInfoService().deleteHealthInfo(userNo);
		
		if(result > 0) {
			
			// 건강계산시 창으로 들어가는 servlet으로 입장, 유저정보 받아야하기때문
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
