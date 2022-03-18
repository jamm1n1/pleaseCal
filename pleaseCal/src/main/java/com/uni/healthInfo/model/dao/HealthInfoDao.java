package com.uni.healthInfo.model.dao;

import static com.uni.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.healthInfo.model.vo.HealthInfo;

public class HealthInfoDao {
	
	private Properties prop = new Properties();
	
	public HealthInfoDao() {
		
		String fileName = HealthInfoDao.class.getResource("/sql/healthInfo/health-query.properties").getPath();
	
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

	public int insertHealth(Connection conn, HealthInfo h) {
		
		int result = 0;
		
		PreparedStatement pstmt= null;
		
		String sql = prop.getProperty("insertHealth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, h.getUserNo());
			pstmt.setInt(2, h.getAge());
			pstmt.setString(3, h.getGen()+"");
			pstmt.setInt(4, h.getHeight());
			pstmt.setInt(5, h.getWeight());
			pstmt.setInt(6, h.getActive());
		
			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public HealthInfo selectHealth(Connection conn, int userNo) {
		
		HealthInfo h = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectHealth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				h= new HealthInfo(rs.getInt("User_NO"),
								  rs.getInt("AGE"),
								  rs.getString("GEN").charAt(0),
								  rs.getInt("HEIGHT"),
								  rs.getInt("WEIGHT"),
								  rs.getInt("ACTIVE")
						
						);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return h;
	}

	public int deleteHealthInfo(Connection conn, int userNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteHealth");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
