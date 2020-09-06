package com.my.ERP.common.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.my.ERP.Human.model.vo.Human;

public class LogoutInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		Human loginUser = (Human)session.getAttribute("loginUser");
		System.out.println("로그인유저가 있나요  : " + loginUser);
		
		if(loginUser == null) {
			response.sendRedirect("/LoginForm");
			return false;
		}
		
		System.out.println("관리자 권한? : " + loginUser.getAdminyn());
		if(!loginUser.getAdminyn().equals("Y")) {
			response.sendRedirect("/LoginForm");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
