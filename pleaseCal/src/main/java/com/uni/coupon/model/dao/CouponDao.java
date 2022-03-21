package com.uni.coupon.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.coupon.model.vo.Coupon;
import com.uni.coupon.model.vo.MemberCoupon;
import com.uni.member.model.dao.MemberDao;
import com.uni.product_IO.model.vo.Product_IO;

public class CouponDao {

	private Properties prop = new Properties();

	public CouponDao() {
		String fileName = MemberDao.class.getResource("/sql/member/coupon-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Coupon> selectList(Connection conn, int userno) {
		ArrayList<Coupon> list = new ArrayList<Coupon>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
        System.out.println(userno);
		String sql = prop.getProperty("membercoupon");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userno);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Coupon c =	new Coupon( 
						               rset.getInt("C_SALE"), 					                      
						               rset.getString("C_NAME"));
                      list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
        System.out.println(list+"다오");
		return list;
	}


	public ArrayList<Coupon> selectList(Connection conn) {
		ArrayList<Coupon> list = new ArrayList<Coupon>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("seecoupon");

		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Coupon c =	new Coupon(rset.getInt("C_ID"),
						               rset.getInt("C_SALE"), 					                      
						               rset.getString("C_NAME"));
                      list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
        System.out.println(list+"다오");
		return list;
	}


	public MemberCoupon get(Connection conn, int userno, int cid) {
		    MemberCoupon c = null;
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
		
		     
			String sql = prop.getProperty("updatecoupon");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, userno);
				pstmt.setInt(2, cid);
			
			rset = pstmt.executeQuery();
		
			
			if(rset.next()) {
				c= new MemberCoupon(
						rset.getString("USER_NO"),
						rset.getInt("C_ID")
												);
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return c;
		}
	}


