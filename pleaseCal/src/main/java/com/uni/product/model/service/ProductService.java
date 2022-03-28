package com.uni.product.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.product.model.dao.ProductDao;
import com.uni.product.model.vo.PImg;
import com.uni.product.model.vo.PInfo;
import com.uni.product.model.vo.Product;
import com.uni.product_IO.model.dao.ProductIoDao;
import com.uni.product_IO.model.service.ProductIoService;
import com.uni.product_IO.model.vo.Product_IO;


public class ProductService {
	
	public ArrayList<Product> productList() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().productList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Product> selectListProduct(int category) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectProductList(conn, category);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Product> topProduct() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().topProduct(conn);
		
		close(conn);
		
		return list;
	}

	public Product selectProduct(int no) {
		
		Connection conn = getConnection();
		
		Product p = new ProductDao().selectProduct(conn, no);
		
		close(conn);
		
		return p;
	}

	public Product changeProduct(int q, String name) {
		
		Connection conn = getConnection();
		
		Product p = new ProductDao().changeProduct(conn, q, name);
		
		close(conn);
		
		return p;
	}

	public ArrayList<Product> searchProduct(String search) {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().searchProduct(conn, search);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Product> orderbyPriceDescProductList() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().orderbyPriceDescProductList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Product> orderbyPriceAscProductList() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().orderbyPriceAscProductList(conn);
		
		close(conn);
		
		return list;
	}

	public int selectpId() {
		
		Connection conn = getConnection();
		
		int pid = new ProductDao().selectpId(conn);
		
		close(conn);
		
		return pid;
	}

	public int insertProduct(Product p, PInfo pInfo, PImg pImg, Product_IO pIo) {
		
		Connection conn = getConnection();
		
		int result1 = new ProductDao().insertProduct(conn, p);
		int result2 = new ProductDao().insertPInfo(conn, pInfo);
		int result3 = new ProductDao().insertPImg(conn, pImg);
		int result4 = new ProductIoDao().insertPIo(conn, pIo);
		System.out.println("result1"+result1);
		System.out.println("result2"+result2);
		System.out.println("result3"+result3);
		System.out.println("result4"+result4);
		
		
		if(result1 * result2 *  result3 * result4 > 0) { // 성공값이 1이여햐하므로
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2 *  result3 * result4; 
	}

	public int deleteProduct(int pId) {
		
		Connection conn = getConnection();
		
		int result = new ProductDao().deleteProduct(conn, pId);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Product> orderbyBestProductList() {
		
		Connection conn = getConnection();
		
		ArrayList<Product> list = new ProductDao().orderbyBestProductList(conn);
		
		close(conn);
		
		return list;
	}

}
