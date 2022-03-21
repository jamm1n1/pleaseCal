package com.uni.coupon.model.service;

import static com.uni.common.JDBCTemplate.close;
import static com.uni.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.coupon.model.dao.CouponDao;
import com.uni.coupon.model.vo.Coupon;
import com.uni.coupon.model.vo.MemberCoupon;
import com.uni.product_IO.model.dao.ProductIoDao;
import com.uni.product_IO.model.vo.Product_IO;

public class CouponService {

	public ArrayList<Coupon> selectcoupon(int userno) {
		Connection conn = getConnection();
        
		ArrayList<Coupon> list = new CouponDao().selectList(conn,userno);

		close(conn);
		 
		return list;
	}

	public ArrayList<Coupon> selectcouponlist() {
Connection conn = getConnection();
        
		ArrayList<Coupon> list = new CouponDao().selectList(conn);

		close(conn);
		 
		return list;
	}

	public MemberCoupon get(int userno, int cid) {
		Connection conn = getConnection();
		
        MemberCoupon c = new CouponDao().get(conn,userno,cid);
		
		close(conn);
		
		
		return c;
	
	}

}
