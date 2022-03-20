package com.uni.product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.Product;


/**
 * Servlet implementation class ProductChangeServlet
 */
@WebServlet("/changeProduct.do")
public class ProductChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int q = Integer.parseInt(request.getParameter("q")); // 포장용량
		String name = request.getParameter("name"); // 제품명

		Product p = new ProductService().changeProduct(q, name);
		
		if(p != null) {
			
			JSONObject changeP = new JSONObject();
			changeP.put("count", p.getpIoCount());
			changeP.put("price", p.getpPrice());
			
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(changeP);
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
