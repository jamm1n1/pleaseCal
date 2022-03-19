package com.uni.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.uni.member.model.vo.Member;
import com.uni.product_IO.model.vo.Product_IO;

import static com.uni.common.JDBCTemplate.*;
public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		System.out.println("fileName   " + fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public Member loginMember(Connection conn, String userId, String userPwd) {
        Member loginUser = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
	     
		String sql = prop.getProperty("loginMember");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
		
		rset = pstmt.executeQuery();
	
		
		if(rset.next()) {
			loginUser = new Member(
					rset.getInt("USER_NO"),
					rset.getString("USER_ID"),
					rset.getString("USER_PWD"),
					rset.getString("USER_NAME"),
					rset.getString("PHONE"),					
					rset.getString("ADDRESS"),	
					rset.getInt("MILEAGE"),
					rset.getInt("C_ID"),		  
					rset.getString("STATUS")
					);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(loginUser);
		return loginUser;
	}
	public int insertMember(Connection conn, Member mem) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,mem.getUserId());
			pstmt.setString(2,mem.getUserPwd());
			pstmt.setString(3,mem.getUserName());
			pstmt.setString(4,mem.getPhone());		
			pstmt.setString(5,mem.getAddress());			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Member> selectList(Connection conn) {
		ArrayList<Member> list = new ArrayList<Member>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("membercheck");

		try {
			pstmt = conn.prepareStatement(sql);
		
		
			rset = pstmt.executeQuery();
			while (rset.next()) {
				Member m =	new Member(rset.getInt("USER_NO"), 
						                       rset.getString("USER_ID"), 
						                       rset.getString("USER_PWD"),
						                       rset.getString("USER_NAME"),
						                       rset.getString("PHONE"),
						                       rset.getString("ADDRESS"),
						                       rset.getInt("MILEAGE"),
						                       rset.getInt("C_ID"),
						                       rset.getString("STATUS") );
						                       
						                                                
                      list.add(m);
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
	public Member selectMember(Connection conn, String userId) {
		// TODO Auto-generated method stub
		Member mem = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
		
		
		if(rset.next()) {
			mem = new Member(rset.getInt("USER_NO"), 
                    rset.getString("USER_ID"), 
                    rset.getString("USER_PWD"),
                    rset.getString("USER_NAME"),
                    rset.getString("PHONE"),
                    rset.getString("ADDRESS"),
                    rset.getInt("MILEAGE"),
                    rset.getInt("C_ID"),
                    rset.getString("STATUS") );
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
	
		return mem;
		
		
	}
	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int updateaddress(Connection conn, String userId, String newaddress) {
		System.out.println(newaddress+"다오");
		int result = 0;
		PreparedStatement pstmt = null;
		String sql =prop.getProperty("updateaddress");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newaddress);
			pstmt.setString(2, userId);
					
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public int deleteMember(Connection conn, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	}
	
	
	
	
	


