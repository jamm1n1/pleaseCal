package com.uni.coupon.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.coupon.model.dao.CouponDao;
import com.uni.coupon.model.vo.Coupon;

public class CouponService {

	public ArrayList<Coupon> selectcoupon(String userId) {
		Connection conn = getConnection();
        
		ArrayList<Coupon> list = new CouponDao().selectList(conn,userId);

		close(conn);
		 
		return list;
	}

}
