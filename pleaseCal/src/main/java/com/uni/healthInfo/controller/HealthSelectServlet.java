package com.uni.healthInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.uni.healthInfo.model.service.HealthInfoService;
import com.uni.healthInfo.model.vo.HealthInfo;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class HealthSelectServlet
 */
@WebServlet("/selectHealthInfo.do")
public class HealthSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HealthSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		int userNo = loginUser.getUserNo();	
		
		HealthInfo h = new HealthInfoService().selectHealth(userNo);
		
		if(h != null) {
			
			JSONObject healthInfo  = new JSONObject();
			healthInfo.put("age", h.getAge());
			healthInfo.put("height", h.getHeight());
			healthInfo.put("weight", h.getWeight());
			healthInfo.put("active", h.getActive());
			healthInfo.put("gen", h.getGen()+"");
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(healthInfo);
			out.flush();
			out.close();
			
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
