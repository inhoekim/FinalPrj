package com.spring.ott.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.spring.ott.service.VisiterService;

public class SessionListener implements HttpSessionListener{
	

		//ip를 가져오는 메소드 만들거임
	public String getIpAddr() {
		String ip_addr = null;
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		
		ip_addr = request.getHeader("X-Forwarded-For");
		if (ip_addr == null) {
			ip_addr = request.getHeader("Proxy-Client-IP");
		}
		if (ip_addr == null) {
			ip_addr = request.getHeader("WL-Proxy-Client-IP"); 
		}
		if (ip_addr == null) {
			ip_addr = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip_addr == null) {
			ip_addr = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip_addr == null) {
			ip_addr = request.getRemoteAddr();
		}
		return ip_addr;
	}
	
	
		@Override
		public void sessionCreated(HttpSessionEvent se ) {
			
			WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
			//HttpSession session =se.getSession();
			
			// 세션 리스너 시작될때 호출
			System.out.println("나 세션리스너! 시작했어");
			try {
			SessionListener taewoo=new SessionListener();
			String ip_address = taewoo.getIpAddr();
			
			System.out.println("아이피 : "+ip_address);
			//HttpSession session =se.getSession();
			
				//service.inservisiter(ip_address);
			((VisiterService)(context.getBean("visiterService"))).inservisiter(ip_address);

			}catch(NullPointerException e) {
				e.printStackTrace();
				System.out.println("리스너 예외 발생 !!" + e);
			}
			
		}
		
		
		@Override
		public void sessionDestroyed(HttpSessionEvent se) {
			// 세션 리스너 종료될때 호출
			System.out.println("나 세션리스너! 종료했어");
		}

	
}
