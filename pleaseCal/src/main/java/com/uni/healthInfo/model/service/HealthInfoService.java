package com.uni.healthInfo.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;

import com.uni.healthInfo.model.dao.HealthInfoDao;
import com.uni.healthInfo.model.vo.HealthInfo;

public class HealthInfoService {

	public int InsertHealth(HealthInfo h) {
		
		Connection conn = getConnection();
		
		int result = new HealthInfoDao().insertHealth(conn, h); 
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public HealthInfo selectHealth(int userNo) {
		
		Connection conn = getConnection();
		
		HealthInfo h = new HealthInfoDao().selectHealth(conn, userNo);
		
		close(conn);
		
		return h;
	}

	public int deleteHealthInfo(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new HealthInfoDao().deleteHealthInfo(conn, userNo); 
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
