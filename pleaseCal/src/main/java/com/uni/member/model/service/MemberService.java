package com.uni.member.model.service;

import java.sql.Connection;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.vo.Member;

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


}
