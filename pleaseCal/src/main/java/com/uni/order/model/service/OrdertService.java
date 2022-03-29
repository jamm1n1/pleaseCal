package com.uni.order.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.order.model.dao.OrderDao;
import com.uni.order.model.vo.Order;

public class OrdertService {

	public int insertOrder(Order o) {
		Connection conn = getConnection();
		
		int result = new OrderDao().insertOrder(conn, o);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Order> selectOrderList(int uNo) {
		Connection conn = getConnection();
		
		ArrayList<Order> list  = new OrderDao().selectOrderList(conn, uNo);
		
		close(conn);
		
		//System.out.println("service list =====" + list);
		return list;
	}

}
