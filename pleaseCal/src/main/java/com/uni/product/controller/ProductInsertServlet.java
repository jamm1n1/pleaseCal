package com.uni.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.uni.product.model.service.ProductService;
import com.uni.product.model.vo.PImg;
import com.uni.product.model.vo.PInfo;
import com.uni.product.model.vo.Product;
import com.uni.product_IO.model.vo.Product_IO;

/**
 * Servlet implementation class ProductInsertServlet
 */
@WebServlet("/productInsert.do")
public class ProductInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10*1024*1024;
			
			String resources = request.getSession().getServletContext().getRealPath("/resources"); // C:\SERVER\jspPro\WebContent\resources
			
			String savePath = resources + "\\image\\";
			System.out.println("savePath: "+savePath);
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8");
			
			int pId = Integer.parseInt(multiRequest.getParameter("pId"));
			System.out.println("pId: "+pId);
			String pName = multiRequest.getParameter("pName");
			int pPrice = Integer.parseInt(multiRequest.getParameter("pPrice"));
			int pQ = Integer.parseInt(multiRequest.getParameter("pQ"));
			int category = Integer.parseInt(multiRequest.getParameter("category"));
			String cal = multiRequest.getParameter("cal");
			String car = multiRequest.getParameter("car");
			String pro = multiRequest.getParameter("pro");
			String fat = multiRequest.getParameter("fat");
			String nat = multiRequest.getParameter("nat");
			int count = Integer.parseInt(multiRequest.getParameter("count"));
			
			Product p = new Product(pId, pName, pPrice, pQ, category);
			PInfo pInfo = new PInfo(pId, cal, car, pro, fat, nat);
			Product_IO pIo = new Product_IO(pId, pName, count);
			
			// 첨부사진 관련
			String fileName = multiRequest.getOriginalFileName("file");

			PImg pImg = new PImg(pId, fileName, savePath);
			
			int result = new ProductService().insertProduct(p, pInfo, pImg, pIo);
			
			if(result > 0) {
				request.setAttribute("msg", "상품 등록 완료");
				RequestDispatcher view = request.getRequestDispatcher("views/member/managerpage.jsp");
				view.forward(request, response);
			} else {
				
				if(pImg != null) {
					File failedFile = new File(fileName);
					failedFile.delete();
				}
				request.setAttribute("msg", "상품 등록 실패");
				RequestDispatcher view = request.getRequestDispatcher("views/member/managerpage.jsp");
				view.forward(request, response);
			}
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
