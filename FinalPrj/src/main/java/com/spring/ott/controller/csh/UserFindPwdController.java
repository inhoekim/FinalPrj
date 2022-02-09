package com.spring.ott.controller.csh;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ott.service.UserService;
import com.spring.ott.vo.UserVo;

@Controller
public class UserFindPwdController {
	@Autowired UserService service;
	@Autowired JavaMailSender javaMailSender;
	@Autowired PasswordEncoder pwdEncoder;
	
	@GetMapping("/findPwd")
	public String findIdForm() {
		return "csh/findPwdForm";
	}
	
	@PostMapping("/findPwd")
	public ModelAndView pwdMail(HttpServletRequest request, String user_id, String email, HttpServletResponse response_email) throws IOException{
		String n=service.findPwdChk(user_id, email);
		ModelAndView mv = new ModelAndView();
		
		if(n!=null) {	//user_id랑 email로 pwd 검색해서 존재하면
			
			Random rnd = new Random();
			int dice = rnd.nextInt(4589362) + 49311;
			
			UserVo vo=new UserVo();
			vo.setPwd(pwdEncoder.encode(Integer.toString(dice)));	//생성된 난수로 비밀번호 설정 & encoding
			System.out.println(vo.getPwd()); //체크용
			service.findPwd(vo);
			
			String setFrom ="yspt12@naver.com";
			String toMail = request.getParameter("email");
			String title = "비밀번호 변경 이메일입니다.";
			String content =
			 	" 새로운 비밀번호는 " +dice+ " 입니다. "
	            +System.getProperty("line.separator")
	            +System.getProperty("line.separator")
	            +"변경된 비밀번호로 로그인 해주세요."; 
			
			try {
				MimeMessage message = javaMailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
				
				messageHelper.setFrom(setFrom);
				messageHelper.setTo(toMail);
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				javaMailSender.send(message);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
					
			mv.setViewName("csh/findPwdForm");
			mv.addObject("resultMsg", "이메일이 발송되었습니다");
	        
	        System.out.println("mv : "+mv);
	
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('이메일이 발송되었습니다. 이메일을 확인해주세요.');</script>");
	        out_email.flush();
        
		}
		else {
			mv.setViewName("csh/findPwdForm");
			mv.addObject("resultMsg", "조회된 정보가 없습니다");
		}
		return mv;	
	}
	
}
