package com.uni.order.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.cart.model.dao.CartDao;
import com.uni.cart.model.vo.Cart;
import com.uni.order.model.vo.Order;
import static com.uni.common.JDBCTemplate.*;


public class OrderDao {

private Properties prop = new Properties();
	
	public OrderDao() {
		
		String fileName = CartDao.class.getResource("/sql/order/order-query.properties").getPath();
		
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
	public int insertOrder(Connection conn, Order o) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		//changeAmount=UPDATE CART SET PRODUCT_AMOUNT = ? WHERE PRODUCT_NAME = ? AND USER_NO = ?
		String sql = prop.getProperty("productInOrderList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, o.getOrderNo());
			pstmt.setInt(2, o.getUserNo());
			pstmt.setInt(3, o.getCartNo());
			pstmt.setInt(4, o.getOrderTOTAmount());
			pstmt.setInt(5, o.getOrderTOTPrice());
			pstmt.setString(6, o.getDeliveryRequest());
			
		
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
	public ArrayList<Order> selectOrderList(Connection conn, int uNo) {
		ArrayList<Order> list = new ArrayList<Order>();
		//Order o = new Order();
		Order o = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOrderList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				o = new Order();
				
				o.setOrderNo(rset.getInt("ORDER_NO"));
				o.setOrderDate(rset.getDate("ORDER_DATE"));
				o.setDeliveryRequest(rset.getString("DELIVERY_REQUEST"));
				o.setPAmount(rset.getInt("PRODUCT_AMOUNT"));
				o.setPPrice(rset.getInt("PRODUCT_PRICE"));
				o.setPiName(rset.getString("PI_NAME"));
				o.setPName(rset.getString("P_NAME"));
				o.setDState(rset.getString("D_STATE"));
				o.setPId(rset.getInt("P_ID"));
				
				if(o.getDeliveryRequest() == null) {
					
					o.setDeliveryRequest("없음");
				}
				list.add(o);
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

}
