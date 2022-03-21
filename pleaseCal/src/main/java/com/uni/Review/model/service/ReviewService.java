package com.uni.Review.model.service;

import static com.uni.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.Review.model.dao.ReviewDao;
import com.uni.Review.model.vo.Review;


public class ReviewService {

	public int reviewLoading(Double oId) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().reviewLoading(conn, oId);
		
		close(conn);
		
		return result;
	}

	public int InsertReview(Review r) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().inserReview(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteReview(int oId, int pId) {
		
		Connection conn = getConnection();
		
		int result = new ReviewDao().deleteReview(conn, oId, pId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public ArrayList<Review> selectReviewList(int pId, int plusId, int plusId2) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, pId, plusId, plusId2);
		
		close(conn);
		
		return list;
	}

}
