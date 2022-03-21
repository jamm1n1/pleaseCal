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
 * Servlet implementation class ProductRanListServlet
 */
@WebServlet("/ranListProduct.do")
public class ProductRanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductRanListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Product> list = new ProductService().productList();
		System.out.println(list);
		
		// 추천상품으로 뿌릴 제품번호만 들어가있는 배열생성
		int[] fix = {1,4,7,10,11,12,13,14};
		int ran;
		int ran2;
		
		// 두 개의 난수가 같지 않을때까지 반복하여 난수 2개 얻음
		while(true) {
			ran = (int)(Math.random() * 7 + 1) ;
			ran2 = (int)(Math.random() * 7 + 1) ;
			
			if(ran != ran2) {
				break;
			}
		}
		
		// 해당 난수의 번호 = 배열 인덱스
		// 배열 인덱스에 해당하는 제품번호 얻음
		// 추천상품리스트에 추가하여 반환
		ArrayList<Product> ranList = new ArrayList<Product>();
		for(int i = 0; i < list.size(); i++) {
			
			if(list.get(i).getpId() == fix[ran] || list.get(i).getpId() == fix[ran2]) {
				ranList.add(list.get(i));
			}
		}

		request.setAttribute("ranList", ranList);
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
