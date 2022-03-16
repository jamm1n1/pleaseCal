package com.uni.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.uni.member.model.vo.Member;
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
	}


