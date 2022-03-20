package com.uni.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

//@WebFilter(filterName = "encodingFilter", urlPatterns = "/*") // 경로는 /*모든곳에서 넘어올때, 어노테이션시 순서,갯수 제한
public class EncodingFilter implements Filter { // javax.servlet.Filter;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//System.out.println("인코딩 필터 동작");
		
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")) {
			System.out.println("post방식요청됨");
			request.setCharacterEncoding("utf-8");
		}
		
		chain.doFilter(request, response); // 이 곳 기준 윗부분은 servlet에 넘어가는부분
		
		//System.out.println("=== servlet 다 동작하고 나서 출력됨");
	}

}
