package com.uni.product_IO.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.vo.Member;
import com.uni.product_IO.model.vo.Product_IO;
import static com.uni.common.JDBCTemplate.*;

public class ProductIoDao {

	private Properties prop = new Properties();

	public ProductIoDao() {
		String fileName = MemberDao.class.getResource("/sql/member/productIo-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	public ArrayList<Product_IO> selectList(Connection conn) {
		ArrayList<Product_IO> list = new ArrayList<Product_IO>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(sql);
		
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Product_IO p =	new Product_IO(rset.getInt("P_ID"), 
						                       rset.getString("P_NAME"), 
						                       rset.getInt("P_NUM"));
                      list.add(p);
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

	public Product_IO piO(Connection conn, int pid, int pnum) {
		   Product_IO pio = null;
			
			PreparedStatement pstmt = null;
			
			ResultSet rset = null;
			
			System.out.println(pid);
			System.out.println(pnum);
		     
			String sql = prop.getProperty("updateIo");
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, pid);
				pstmt.setInt(2, pnum);
			
			rset = pstmt.executeQuery();
		
			
			if(rset.next()) {
				pio= new Product_IO(
						rset.getInt("P_NUM"),
						rset.getInt("P_ID")
												);
			}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return pio;
		}
	
	public Product_IO selctProductIo(Connection conn, int no) {
		
		Product_IO io = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("selctProductIo");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				io = new Product_IO();
				io.setPnum(rs.getInt("P_NUM"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return io;
	}
}


