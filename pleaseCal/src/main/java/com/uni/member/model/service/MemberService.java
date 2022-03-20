package com.uni.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.member.model.dao.MemberDao;

import com.uni.member.model.vo.Member;
import com.uni.product_IO.model.dao.ProductIoDao;
import com.uni.product_IO.model.vo.Product_IO;

import static com.uni.common.JDBCTemplate.*;
public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn,userId,userPwd);
		
		close(conn);
		
		
		return loginUser;
	}

	public int insertMember(Member mem) {
        Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn,mem);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
			
		}
		close(conn);		
		return result;
	}

	public ArrayList<Member> selectList() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDao().selectList(conn);

		close(conn);
		 
		return list;
	}

	public Member updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Member updateMem = null;
		int result = new MemberDao().updatePwd(conn, userId, userPwd , newPwd);
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public Member updateaddress(String userId, String newaddress) {
		Connection conn = getConnection();
		Member updateMem = null;
		int result = new MemberDao().updateaddress(conn, userId, newaddress);
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, userId);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMem;
	}

	public int deleteMember(String userId) {
		
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn,userId);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}

	public Member selectMember(String userId) {
		Connection conn = getConnection();
		Member mem = new MemberDao().selectMember(conn,userId);
		
		close(conn);
		return mem;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn,userId);
		System.out.println(userId+"서비스");
		close(conn);
		return result;
	}

	




}
