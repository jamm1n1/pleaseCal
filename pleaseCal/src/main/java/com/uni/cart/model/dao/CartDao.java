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

import static com.uni.common.JDBCTemplate.*;
public class CartDao {
	
private Properties prop = new Properties();
	
	public CartDao() {
		
		String fileName = CartDao.class.getResource("/sql/cart/cart-query.properties").getPath();
		
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
	// 장바구니 안의 상품 정보를 가져오는 메소드.
	public ArrayList<Cart> CartList(Connection conn, String writer) {
		ArrayList<Cart> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCartList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(writer));
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Cart c = new Cart(rset.getInt("CART_NO"),
								  rset.getInt("P_ID"),
								  rset.getString("PI_NAME"),
								  rset.getInt("P_PRICE"),
								  rset.getInt("PRODUCT_PRICE"),
								  rset.getInt("PRODUCT_AMOUNT"),
								  rset.getString("P_NAME"),
							  	  rset.getDate("D_DATE"),
							  	  rset.getInt("P_NUM"));
				
				list.add(c);

			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}
	// 상품 수량을 수정하는 메소드
	public int changeAmount(Connection conn, int q, String name, String writer, int p) {
		int result = 0;
		
		PreparedStatement pstmt = null;

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
		return result;
	}
	// 회원 정보를 가져오는 메소드
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
	
		return m;		
	}
	// 상품 정보를 장바구니에 입력하는 메소드
	public int insertProduct(Connection conn, String writer, String amount, String pPrice, String pId) {
		int result = 0;
		
		PreparedStatement pstmt = null;

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
		return result;
	}
	// 상품의 상태값을 N에서 Y로 변경해주는 메소드
	public int updateCart(Connection conn, String writer) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(writer));
			
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		return result;
	}
	// 장바구니 안의 상품정보를 가져오는 메소드
	public Cart selectPId(Connection conn, String writer, String pId) {
		Cart c = new Cart();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectProduct");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pId);
			pstmt.setString(2, writer);
			
			rset = pstmt.executeQuery();
		
		
		if(rset.next()) {
			c.setPId(rset.getInt("P_ID"));
			c.setPAmount(rset.getInt("PRODUCT_AMOUNT"));
			c.setPPrice(rset.getInt("PRODUCT_PRICE"));
                 
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return c;
	}
	// 장바구니 상품의 수량을 변경하는 메소드
	public int PlusAmount(Connection conn, int nAmount, String writer, String pId, int nPrice) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("plusCartProduct");
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nAmount);
			pstmt.setInt(2, nPrice);
			pstmt.setInt(3, Integer.parseInt(pId));
			pstmt.setInt(4, Integer.parseInt(writer));
			
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		return result;
	}
	// 장바구니 상품을 삭제하는 메소드
	public int deleteProduct(Connection conn, String uNo, int pId) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteProduct");
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(uNo));
			pstmt.setInt(2, pId);
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		return result;
	}
	// 상품의 이미지명, 상품명, 배송예정날짜를 받아오는 메소드
	public Cart selectProduct(Connection conn, int pId) {
		Cart c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPaymentProduct");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
		
		
		if(rset.next()) {
			 c = new Cart(
					rset.getString("PI_NAME"),
					rset.getString("P_NAME"),
					rset.getDate("D_DATE"));
                 
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	// 상품의 상세정보에서 주문페이지로 쓰일 상품 정보를 가져오는 메소드
	public Cart selectDetailProduct(Connection conn, int pId) {
		Cart c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailProduct");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
		
		
		if(rset.next()) {
			 c = new Cart();
					 
			c.setPId(rset.getInt("P_ID"));
			c.setPName(rset.getString("P_NAME"));
			c.setPiName(rset.getString("PI_NAME"));
			c.setDDate(rset.getDate("D_DATE"));
                 
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return c;
	}
	// 선택한 상품을 장바구니로 넣어주는 메소드
	public int insertSelectProduct(Connection conn, String writer, String pA, String pP, String pId) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSelectCart");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(writer));
			pstmt.setInt(2, Integer.parseInt(pA));
			pstmt.setInt(3, Integer.parseInt(pP));
			pstmt.setInt(4, Integer.parseInt(pId));
			
		
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally {
			close(pstmt);
		}
		return result;
	}

}
