package com.test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class TestFilter extends HttpServlet implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6980666836349679645L;

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain filterchain) throws IOException, ServletException {
		System.out.println("测试过滤器1111111111");
//		   此处为过滤链 理解为请求通过该过滤继续前行 可在此处加上判断 如果TRUE执行该语句 有过FALSE 则直接跳转其他页面 常用于判断是否有权限进入某页面 
	   filterchain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		System.out.println("测试过滤器222222222");
		
	}
}