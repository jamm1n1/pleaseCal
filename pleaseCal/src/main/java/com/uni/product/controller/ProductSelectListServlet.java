package com.uni.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.Product;

/**
 * Servlet implementation class ProductSelectListServlet
 */
@WebServlet("/selectListProduct.do")
public class ProductSelectListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelectListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int category = Integer.parseInt(request.getParameter("no"));
		
		ArrayList<Product> list = new ProductService().selectListProduct(category);
		
		// 전체상품중에 프로틴 제품은 포장용량 500 인것만 골라서 반환
		ArrayList<Product> changelist = new ArrayList<Product>();
		if(category == 2) {
			for(Product p : list) {
				if(p.getpQuantity() == 500) {
					changelist.add(p);
					
				}
			}
			request.setAttribute("list", changelist);
			response.setContentType("application/json; charset=utf-8"); 
			new Gson().toJson(list, response.getWriter());
		} else {
			request.setAttribute("list", list);
			response.setContentType("application/json; charset=utf-8"); 
			new Gson().toJson(list, response.getWriter());
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
