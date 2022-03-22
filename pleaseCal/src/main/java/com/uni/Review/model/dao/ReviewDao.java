package com.uni.Review.model.dao;

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
import com.uni.Review.model.vo.Review;
import com.uni.product.model.dao.ProductDao;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		
		String fileName = ProductDao.class.getResource("/sql/review/review-query.properties").getPath();
		
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

	public int reviewLoading(Connection conn, Double oId) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("reviewLoading");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setDouble(1, oId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
				
		
		
		
		return result;
	}

	public int inserReview(Connection conn, Review r) {
		
		int result = 0; 
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("inserReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getOrderNo());
			pstmt.setInt(2, r.getpId());
			pstmt.setString(3, r.getrName());
			pstmt.setString(4, r.getrContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}		
		
		return result;
	}

	public int deleteReview(Connection conn, int oId, int pId) {
		
		int result = 0; 
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, oId);
			pstmt.setInt(2, pId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			close(pstmt);
		}		
		
		return result;
	}

	public ArrayList<Review> selectReviewList(Connection conn, int pId, int plusId, int plusId2) {
		
		ArrayList<Review> list = new ArrayList<Review>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pId);
			pstmt.setInt(2, plusId);
			pstmt.setInt(3, plusId2);
			
			rs = pstmt.executeQuery();
			
			Review r = null;
			while (rs.next()) {
				
				r = new Review();
				r.setrName(rs.getString("R_NAME"));
				r.setrContent(rs.getString("R_CONTENT"));
				r.setrUpdate(rs.getDate("R_UPDATE"));
			
				list.add(r);
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

	public ArrayList<Review> topReviewList(Connection conn) {
		
ArrayList<Review> list = new ArrayList<Review>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("topReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			Review r = null;
			while (rs.next()) {
				
				r = new Review();
				r.setrName(rs.getString("R_NAME"));
				r.setrContent(rs.getString("R_CONTENT"));
				r.setPiName(rs.getString("PI_NAME"));
				r.setpId(rs.getInt("P_ID"));
				list.add(r);
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
