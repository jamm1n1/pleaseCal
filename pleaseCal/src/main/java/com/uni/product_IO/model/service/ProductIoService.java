package com.uni.product_IO.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.uni.member.model.dao.MemberDao;
import com.uni.member.model.vo.Member;
import com.uni.product_IO.model.dao.ProductIoDao;
import com.uni.product_IO.model.vo.Product_IO;
import static com.uni.common.JDBCTemplate.*;

public class ProductIoService {

	public ArrayList<Product_IO> selectList() {
		
		Connection conn = getConnection();

		ArrayList<Product_IO> list = new ProductIoDao().selectList(conn);

		close(conn);
		 
		return list;
	}

	public Product_IO piO(int pid, int pnum) {
		
		Connection conn = getConnection();
		
		Product_IO pio = new ProductIoDao().piO(conn,pid,pnum);
		
		close(conn);
		
		
		return pio;
	}
	
	public Product_IO selctProductIo(int no) {
		
		Connection conn = getConnection();
		
		Product_IO io = new ProductIoDao().selctProductIo(conn, no);
		
		close(conn);
		
		return io;
	}


}
