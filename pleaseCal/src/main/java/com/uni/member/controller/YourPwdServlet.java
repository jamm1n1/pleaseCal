package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;


/**
 * Servlet implementation class YourIDServlet
 */
@WebServlet("/checkedpwd.do")
public class YourPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public YourPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userid");
		String usertel = request.getParameter("tel");
		
		
		
		Member loginUser = new MemberService().findpwd(id,usertel); 
       System.out.println(loginUser+"서블렛");
			
			
			request.setAttribute("loginUser", loginUser);
			RequestDispatcher view = request.getRequestDispatcher("views/member/yourpwd.jsp");
			view.forward(request, response);
      
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
