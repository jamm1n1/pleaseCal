package com.uni.cart.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.cart.model.dao.CartDao;
import com.uni.cart.model.vo.Cart;
import com.uni.member.model.vo.Member;
import com.uni.product.model.dao.ProductDao;
import com.uni.product.model.vo.Product;

import static com.uni.common.JDBCTemplate.*;

public class CartService {

	public ArrayList<Cart> CartList(String writer) {
		Connection conn = getConnection();
		
		ArrayList<Cart> list = new CartDao().CartList(conn, writer);
		//System.out.println("Service list ============" + list);
		close(conn);
		
		return list;

	}
	
	/*
	public Cart CartList(String writer) {
		Connection conn = getConnection();
		
		Cart c = new CartDao().CartList(conn, writer);
		//System.out.println("service c : " + c);
		//System.out.println("Service list ============" + list);
		close(conn);
		
		return c;

	}
*/
	public int changeAmount(int q, String name, String writer, int p) {
		Connection conn = getConnection();
		
		int result = new CartDao().changeAmount(conn, q, name, writer, p);
		
		close(conn);
		
		return result;
	}

	public Member MemberInfo(String writer) {
		Connection conn = getConnection();
		
		Member m = new CartDao().MemberInfo(conn, writer);
		//System.out.println("service c : " + c);
		//System.out.println("Service list ============" + list);
		close(conn);
		
		return m;
	}

}
