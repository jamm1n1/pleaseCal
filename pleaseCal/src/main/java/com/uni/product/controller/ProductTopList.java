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
 * Servlet implementation class ProductTopList
 */
@WebServlet("/topProduct.do")
public class ProductTopList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductTopList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product> list = new ProductService().productList();
		
		int ran;
		int ran2;
		int ran3;
		int ran4;
		
		// 난수가 같지 않을때까지 반복하여 난수 4개 얻음
		while(true) {
			ran = (int)(Math.random() * list.size()) ;
			ran2 = (int)(Math.random() * list.size()) ;
			ran3 = (int)(Math.random() * list.size()) ;
			ran4 = (int)(Math.random() * list.size()) ;
			
			if(ran != ran2 && ran2 != ran3 && ran3 != ran4 && ran != ran3 && ran != ran4 && ran2 != ran4) {
				System.out.println(ran);
				System.out.println(ran2);
				System.out.println(ran3);
				System.out.println(ran4);
				break;
			}
		}

		ArrayList<Product> ranList = new ArrayList<Product>();
		for(int i = 0; i < list.size(); i++) {
			
			if(i == ran || i == ran2 || i == ran3 || i == ran4) {
				ranList.add(list.get(i));
			}
		}

		response.setContentType("application/json; charset=utf-8"); 
		new Gson().toJson(ranList, response.getWriter());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
