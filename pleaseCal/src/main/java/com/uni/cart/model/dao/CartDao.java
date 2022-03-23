package com.uni.cart.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.cart.model.vo.Cart;
import com.uni.member.model.vo.Member;
import com.uni.product.model.vo.Product;

import static com.uni.common.JDBCTemplate.*;
public class CartDao {
	
private Properties prop = new Properties();
	
	public CartDao() {
		
		String fileName = CartDao.class.getResource("/sql/cart/cart-query.properties").getPath();
		
		//System.out.println("fileName   " + fileName);
		
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

	public ArrayList<Cart> CartList(Connection conn, String writer) {
		ArrayList<Cart> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCartList");
		//System.out.println("DAO sql : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(writer));
			//System.out.println("Dao writer : " + writer);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Cart c = new Cart(rset.getInt("CART_NO"),
								  rset.getInt("P_ID"),
								  rset.getString("PI_NAME"),
								  rset.getInt("P_PRICE"),
								  rset.getInt("PRODUCT_PRICE"),
								  rset.getInt("PRODUCT_AMOUNT"),
								  rset.getString("P_NAME"),
							  	  rset.getDate("D_DATE"));
				
				list.add(c);
				//System.out.println("Dao list =====" + list);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println("Dao list : " + list);
		return list;
	}
	
	/*
	public Cart CartList(Connection conn, String writer) {
		Cart c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCartList");
		//System.out.println("DAO sql : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(writer));
			//System.out.println("Dao writer : " + writer);
			rset = pstmt.executeQuery();
			
				if(rset.next()) {
				 c = new Cart(rset.getInt("CART_NO"),
								  rset.getInt("P_ID"),
								  rset.getString("PI_NAME"),
								  rset.getInt("P_PRICE"),
								  rset.getInt("PRODUCT_PRICE"),
								  rset.getInt("PRODUCT_AMOUNT"),
								  rset.getString("P_NAME"),
							  	  rset.getDate("D_DATE"));
				
				}
				//System.out.println("Dao list =====" + c);
				//System.out.println("Dao c : " + c);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		//System.out.println("Dao list : " + list);
		return c;
	}
	*/
	
	public int changeAmount(Connection conn, int q, String name, String writer, int p) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		//changeAmount=UPDATE CART SET PRODUCT_AMOUNT = ? WHERE PRODUCT_NAME = ? AND USER_NO = ?
		String sql = prop.getProperty("changeAmount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q);
			pstmt.setInt(2, p);
			pstmt.setString(3, name);
			pstmt.setInt(4, Integer.parseInt(writer));
			
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		//System.out.println("Dao result : " + result);
		return result;
	}
	public Member MemberInfo(Connection conn, String writer) {
		// TODO Auto-generated method stub
				Member m = null;
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				String sql = prop.getProperty("selectMember");
			
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, writer);
					rset = pstmt.executeQuery();
				
				
				if(rset.next()) {
					m = new Member(rset.getInt("USER_NO"), 
		                    rset.getString("USER_NAME"),
		                    rset.getString("PHONE"),
		                    rset.getString("ADDRESS"),
		                    rset.getInt("MILEAGE"),
		                    rset.getInt("C_ID"));
				}
				}catch(SQLException e) {
					e.printStackTrace();
				}finally {
					close(rset);
					close(pstmt);
				}
				//System.out.println("Dao m = " + m);
			
				return m;
				
	}

	public int insertProduct(Connection conn, String writer, String amount, String pPrice, String pId) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		//changeAmount=UPDATE CART SET PRODUCT_AMOUNT = ? WHERE PRODUCT_NAME = ? AND USER_NO = ?
		String sql = prop.getProperty("insertCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(writer));
			pstmt.setInt(2, Integer.parseInt(amount));
			pstmt.setInt(3, Integer.parseInt(pPrice));
			pstmt.setInt(4, Integer.parseInt(pId));
			
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		//System.out.println("Dao result : " + result);
		return result;
	}

}
