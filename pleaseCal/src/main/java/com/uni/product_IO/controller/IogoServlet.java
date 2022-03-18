package com.uni.product_IO.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.member.model.service.MemberService;
import com.uni.member.model.vo.Member;
import com.uni.product_IO.model.service.ProductIoService;
import com.uni.product_IO.model.vo.Product_IO;

/**
 * Servlet implementation class IogoServlet
 */
@WebServlet("/iogogo.do")
public class IogoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IogoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid")) ;
		int pnum = Integer.parseInt(request.getParameter("pnum")) ;
		Product_IO pIO = new ProductIoService().piO(pid,pnum); 
		
		RequestDispatcher rd = request.getRequestDispatcher("views/member/managerpage.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
