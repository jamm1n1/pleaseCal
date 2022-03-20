package com.uni.product_IO.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class ProductGoServlet
 */
@WebServlet("/Product_IO.do")
public class ProductGoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductGoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product_IO> list = new ProductIoService().selectList();
		request.setAttribute("list", list);		
		RequestDispatcher rd = request.getRequestDispatcher("views/member/product_IO.jsp");
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
