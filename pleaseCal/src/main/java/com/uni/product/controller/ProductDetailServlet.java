package com.uni.product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.uni.member.model.vo.Member;
import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.Product;
import com.uni.product_IO.model.service.ProductIoService;
import com.uni.product_IO.model.vo.Product_IO;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/detailProduct.do")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));

		Product p = new ProductService().selectProduct(no);
		Product_IO io = new ProductIoService().selctProductIo(no);
		
		request.setAttribute("p", p);
		request.setAttribute("io", io);
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		if(m == null) {
			request.setAttribute("userNo", "0");
		} else {
			request.setAttribute("userNo", m.getUserNo());
		}

		request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
