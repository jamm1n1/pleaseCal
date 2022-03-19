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
 * Servlet implementation class UpdateAdrressServlet
 */
@WebServlet("/addressupdate.do")
public class UpdateAdrressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdrressServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		  Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		  String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
			
		
			String newaddress = request.getParameter("newaddress");
			String orginaddress = (String)request.getAttribute("orginaddress");
			 Member member = new MemberService().selectMember(userId);
			Member updateMem = new MemberService().updateaddress(userId,newaddress);
					
			RequestDispatcher view = request.getRequestDispatcher("views/member/mypage.jsp"); 
			if(updateMem != null) { // 수정한 객체가 null이 아니면 된거임 
				request.setAttribute("loginUser", member);	
				request.getSession().setAttribute("loginUser", updateMem);
				request.getSession().setAttribute("orginaddress", orginaddress);
			}else {
				request.setAttribute("msg", "비밀번호 변경에 실패 했습니다.");
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
