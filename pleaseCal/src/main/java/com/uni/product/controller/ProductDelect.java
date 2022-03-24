package com.uni.product.controller;

import java.io.IOException;

import javax.accessibility.AccessibleSelection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uni.product.model.service.ProductService;

/**
 * Servlet implementation class ProductDelectForm
 */
@WebServlet("/deleteProduct.do")
public class ProductDelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		int result = new ProductService().deleteProduct(pid);
		
		if(result > 0) {
			request.setAttribute("tag", "Y");
			request.setAttribute("msg", "상품삭제완료");
			request.getRequestDispatcher("views/member/managerpage.jsp").forward(request, response);
			
		} else {
			
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
