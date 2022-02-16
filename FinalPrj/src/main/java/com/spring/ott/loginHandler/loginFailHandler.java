package com.spring.ott.loginHandler;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.util.MessageUtils;

public class loginFailHandler implements AuthenticationFailureHandler{
	private String user_id;
    private String pwd;
    private String errormsgname;
    private String defaultFailureUrl;
	
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter(user_id);
        String errormsg = null;
	        
        if(exception instanceof BadCredentialsException) {
            errormsg = MessageUtils.getMessage("error.BadCredentials");
        } else if(exception instanceof InternalAuthenticationServiceException) {
            errormsg = MessageUtils.getMessage("error.BadCredentials");
        } else if(exception instanceof DisabledException) {
            errormsg = MessageUtils.getMessage("error.Disabled");
        } else if(exception instanceof CredentialsExpiredException) {
            errormsg = MessageUtils.getMessage("error.CredentialsExpired");
        } else if(exception instanceof LockedException) {
        	errormsg = MessageUtils.getMessage("error.Locked");
        }

        
        request.setAttribute(user_id, username);
        request.setAttribute(errormsgname, errormsg);
        
//        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
        response.sendRedirect(request.getContextPath()+"?login=true&errormsg="+URLEncoder.encode(errormsg, "utf-8"));
        
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getErrormsgname() {
		return errormsgname;
	}

	public void setErrormsgname(String errormsgname) {
		this.errormsgname = errormsgname;
	}

	public String getDefaultFailureUrl() {
		return defaultFailureUrl;
	}

	public void setDefaultFailureUrl(String defaultFailureUrl) {
		this.defaultFailureUrl = defaultFailureUrl;
	}
	
	
}
