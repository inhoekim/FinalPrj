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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MailController {
	@Autowired JavaMailSender javaMailSender;
	
//	@GetMapping("/email")
//    public String email() {
//        return "csh/email";
//    }
	
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailSending(@RequestParam("email") String email) throws IOException{
		
		Random rnd = new Random();
		int dice = rnd.nextInt(4589362) + 49311;
		System.out.println("#######인증 번호######## :" +dice);
		String setFrom ="yspt12@naver.com";
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
		String content =
		 	" 인증번호는 " +dice+ " 입니다. "
            +System.getProperty("line.separator")
            +System.getProperty("line.separator")
            +"받으신 인증번호를 홈페이지에 입력해 주세요."; 
		String num="";
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"utf-8");
			
			messageHelper.setFrom(setFrom);
			messageHelper.setTo(toMail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			javaMailSender.send(message);
			
			num=Integer.toString(dice);
			
		} catch(Exception e) {
			e.printStackTrace();
			num="error";
		}
				
		return num;
	}
//	
//	@PostMapping("/join_auth{dice}")
//	public ModelAndView join_auth(String email_auth, @PathVariable String dice, HttpServletRequest request, HttpServletResponse response_equals) throws IOException{
//        System.out.println("마지막 : email_auth : "+email_auth);
//        System.out.println("마지막 : dice : "+dice);
//        String email_id=request.getParameter("email_id");
//        ModelAndView mv = new ModelAndView();
//        //dice: 메일인증번호
//        //email_auth: 사용자가 입력한 인증번호
//        mv.addObject("dice",dice);  
//        response_equals.setContentType("text/html; charset=UTF-8");
//        PrintWriter out_equals = response_equals.getWriter();
//        //인증번호 일치
//        if (email_auth.equals(dice)) {
//        	mv.setViewName("csh/userJoin");
//            mv.addObject("email_id",email_id);  
//            out_equals.println("<script>alert('인증번호가 일치합니다. 회원가입창으로 이동합니다.');</script>");
//            out_equals.flush();
//        //인증번호 불일치
//        }else if (email_auth != dice) {    
//        	mv.setViewName("csh/email_auth");
//        	mv.addObject("email_id",email_id);
//            out_equals.println("<script>alert('인증번호가 일치하지 않습니다. 인증번호를 다시 입력해주세요.');</script>");
//            out_equals.flush();       
//        }
//        return mv;
//	}
}