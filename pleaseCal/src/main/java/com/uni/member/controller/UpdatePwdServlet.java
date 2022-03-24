package com.uni.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/updatePwdMember.do")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
	    String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
	    Member member = new MemberService().selectMember(userId);
		String userPwd = request.getParameter("userPwd");
		String newPwd = request.getParameter("newPwd");
		String orginPwd = (String)request.getAttribute("orginPwd");
		
		Member updateMem = new MemberService().updatePwd(userId,userPwd,newPwd);
				
		RequestDispatcher view = request.getRequestDispatcher("views/member/mypage.jsp"); 
		if(updateMem != null) { // 수정한 객체가 null이 아니면 된거임 
			request.setAttribute("loginUser", member);			
			request.getSession().setAttribute("loginUser", updateMem);
			request.getSession().setAttribute("loginPwd", orginPwd);
		
		}
		
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
