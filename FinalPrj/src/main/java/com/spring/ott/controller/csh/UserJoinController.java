package com.spring.ott.controller.csh;

import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;
import com.spring.ott.vo.UserVo;



@Controller
public class UserJoinController {
	@Autowired UserService service;
	@Autowired PostService pservice;
	@Autowired CommentsService cservice;
	@Autowired private ServletContext servletContext;
	
	@GetMapping("/join")
	public String joinForm(Model model) {
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
		return "home/userJoin.tiles";
	}
	@PostMapping("/join")
	public String join(@Valid UserVo uVo, AuthoritiesVo aVo, Model model,HttpServletRequest request) {
		String jnum1=request.getParameter("jnum1");
		String jnum2=request.getParameter("jnum2");
		uVo.setJnum(jnum1+"-"+jnum2);
		
		/* 김인회 수정 Start */
		Random random = new Random();
		int rvalue = random.nextInt(4) + 1;
		if(jnum2.charAt(0) == '2') { rvalue += 4;} //여성인 경우
		uVo.setProfile_id(rvalue);
		/* 김인회 수정 End */
		
		try {
			service.insert(uVo);
			service.insertAuth(aVo);
			model.addAttribute("msg", "회원가입에 성공하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "오류로 인해 회원가입이 실패하였습니다!");
			model.addAttribute("url", servletContext.getContextPath() + "/");
		}
		return "home/alert";
	}
}