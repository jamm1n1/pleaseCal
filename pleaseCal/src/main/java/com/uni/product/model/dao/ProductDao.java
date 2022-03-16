package com.uni.product.model.dao;

import static com.uni.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.sun.net.httpserver.Authenticator.Result;
import com.uni.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	
	public ProductDao() {
		
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		System.out.println("fileName   " + fileName);
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Product> productList(Connection conn) {
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				Product p = new Product(rs.getInt("P_ID"),
										rs.getString("P_NAME"),
										rs.getInt("P_PRICE"),
										rs.getInt("P_QUANTITY"),
										rs.getInt("C_ID"),
										rs.getString("P_KCAL"),
										rs.getString("P_CARBO"),
										rs.getString("P_PROTEIN"),
										rs.getString("P_FAT"),
										rs.getString("P_NATRIUM")
						);
			
				
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Product> selectProductList(Connection conn, int category) {
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectProductList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, category);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Product p = new Product(rs.getInt("P_ID"),
										rs.getString("P_NAME"),
										rs.getInt("P_PRICE"),
										rs.getInt("P_QUANTITY"),
										rs.getInt("C_ID"),
										rs.getString("P_KCAL"),
										rs.getString("P_CARBO"),
										rs.getString("P_PROTEIN"),
										rs.getString("P_FAT"),
										rs.getString("P_NATRIUM")
						);
			
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public ArrayList<Product> topProduct(Connection conn) {
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("topProduct");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				Product p = new Product(rs.getInt("P_ID"),
										rs.getString("P_NAME"),
										rs.getInt("P_PRICE"),
										rs.getInt("P_QUANTITY"),
										rs.getInt("C_ID"),
										rs.getString("P_KCAL"),
										rs.getString("P_CARBO"),
										rs.getString("P_PROTEIN"),
										rs.getString("P_FAT"),
										rs.getString("P_NATRIUM")
						);
			
				
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
