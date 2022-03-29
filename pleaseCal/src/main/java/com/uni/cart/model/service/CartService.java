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

	public int insertProduct(String writer, String amount, String pPrice, String pId) {
		Connection conn = getConnection();
		
		int result = new CartDao().insertProduct(conn, writer, amount, pPrice, pId);
		
		close(conn);
		
		return result;
	}


	public int updateCart(String writer) {
		Connection conn = getConnection();
		
		int result = new CartDao().updateCart(conn, writer);
		
		close(conn);
		
		return result;
	}

	public Cart selectPId(String writer, String pId) {
		Connection conn = getConnection();
		
		Cart c = new CartDao().selectPId(conn, writer, pId);
		//System.out.println("Service list ============" + list);
		close(conn);
		
		return c;
	}

	public int PlusAmount(int nAmount, String writer, String pId, int nPrice) {
		Connection conn = getConnection();
		
		int result = new CartDao().PlusAmount(conn, nAmount, writer, pId, nPrice);
		
		close(conn);
		
		return result;
	}

	public int deleteProduct(String uNo, int pId) {
		Connection conn = getConnection();
		
		int result = new CartDao().deleteProduct(conn, uNo, pId);
		
		close(conn);
		
		return result;
	}

	public Cart selectProduct(int pId) {
	
		Connection conn = getConnection();
		
		Cart c = new CartDao().selectProduct(conn, pId);
		//System.out.println("Service list ============" + list);
		close(conn);
		
		return c;
	}

	public Cart selectDetailProduct(int pId) {
		Connection conn = getConnection();
		
		Cart c = new CartDao().selectDetailProduct(conn, pId);
		//System.out.println("Service list ============" + list);
		close(conn);
		
		return c;
	}

	public int insertSelectProduct(String writer, String pA, String pP, String pId) {
		Connection conn = getConnection();
		
		int result = new CartDao().insertSelectProduct(conn, writer, pA, pP, pId);
		
		close(conn);
		
		return result;
	}

}
