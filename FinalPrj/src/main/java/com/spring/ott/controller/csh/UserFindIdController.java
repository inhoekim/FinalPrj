package com.spring.ott.controller.csh;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;
import com.spring.ott.vo.UserVo;

@Controller
public class UserFindIdController {
	@Autowired UserService service;
	@Autowired JavaMailSender javaMailSender;
	@Autowired PasswordEncoder pwdEncoder;
	@Autowired PostService pservice;
	@Autowired CommentsService cservice;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/findId")
	public String findIdForm(Model model) {
		List<PostVo> rList=pservice.recentPost();
		List<PostVo> bList=pservice.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = pservice.recent_findParty();	
		model.addAttribute("rPList", rPList);
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		return "home/findID.tiles";
	}
	
	@PostMapping("/findId")
	public String findId(String name, String email, Model model) {
		String user_id=service.findId(name, email);
		List<PostVo> rList=pservice.recentPost();
		List<PostVo> bList=pservice.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = pservice.recent_findParty();	
		model.addAttribute("rPList", rPList);
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		
		try {
			if(user_id==null) {
				model.addAttribute("user_id","????????? ????????? ????????????");
			}else {
				model.addAttribute("user_id","???????????? ????????? : " +user_id);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "home/findID.tiles"; 
	}
	
	@GetMapping("/findPwd")
	public String findPwdForm(Model model) {
		List<PostVo> rList=pservice.recentPost();
		List<PostVo> bList=pservice.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = pservice.recent_findParty();	
		model.addAttribute("rPList", rPList);
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		return "home/findID.tiles";
	}
	
	@PostMapping("/findPwd")
	public ModelAndView pwdMail(HttpServletRequest request, String user_id, String email, HttpServletResponse response_email,Model model) throws IOException{
		UserVo vo=service.findPwdChk(user_id, email);
		ModelAndView mv = new ModelAndView();
		List<PostVo> rList=pservice.recentPost();
		List<PostVo> bList=pservice.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = pservice.recent_findParty();	
		model.addAttribute("rPList", rPList);
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		
		if(vo!=null) {	//user_id??? email??? pwd ???????????? ????????????
			
			Random rnd = new Random();
			int dice = rnd.nextInt(4589362) + 49311;
			System.out.println("dice : " + dice); //??????
			vo.setPwd(pwdEncoder.encode(Integer.toString(dice)));	//????????? ????????? ???????????? ?????? & encoding
			System.out.println(vo.getPwd()); //?????????
			service.findPwd(vo);
			
			String setFrom ="yspt12@naver.com";
			String toMail = request.getParameter("email");
			String title = "???????????? ?????? ??????????????????.";
			String content =
			 	" ????????? ??????????????? " +dice+ " ?????????. "
	            +System.getProperty("line.separator")
	            +System.getProperty("line.separator")
	            +"????????? ??????????????? ????????? ????????????."; 
			
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
					
			mv.setViewName("home/findID.tiles");
			mv.addObject("resultMsg", "???????????? ?????????????????????");
	        
	        System.out.println("mv : "+mv);
	
	        response_email.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_email = response_email.getWriter();
	        out_email.println("<script>alert('???????????? ?????????????????????. ???????????? ??????????????????.');</script>");
	        out_email.flush();
        
		}
		else {
			mv.setViewName("home/findID.tiles");
			mv.addObject("resultMsg", "????????? ????????? ????????????");
		}
		return mv;	
	}
	
}
