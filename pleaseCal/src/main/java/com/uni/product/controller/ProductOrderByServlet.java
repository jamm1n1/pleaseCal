package com.uni.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.Product;

/**
 * Servlet implementation class ProductOrderByServlet
 */
@WebServlet("/orderbyProduct.do")
public class ProductOrderByServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOrderByServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderby = Integer.parseInt(request.getParameter("orderby"));
		System.out.println("이거:"+orderby);
		
		ArrayList<Product> list = null;
		if(orderby == 2) { // 가격내림차순
			list = new ProductService().orderbyPriceDescProductList();
		} else if(orderby == 3) { // 가격오름차순
			list = new ProductService().orderbyPriceAscProductList();
		} else { // 인기순
			list = new ProductService().orderbyBestProductList();
		}
		
		response.setContentType("application/json; charset=utf-8"); 
		new Gson().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
