package com.spring.ott.controller.csh;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.BlackListManiService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.BlackListVo;

@Controller
public class BlackListController {
	
	@Autowired BlackListManiService bService;
	@Autowired UserService uService;
	
	@RequestMapping("/enrollBlack")
	public String enrollBlackList(String user_id, BlackListVo bVo, HttpServletRequest req) {
		//n일 가져오기
		int n=Integer.parseInt(req.getParameter("n"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal=Calendar.getInstance();
		//오늘로부터 n일 뒤
		cal.add(Calendar.DATE, n);
		//yyyy-MM-dd로 형태 변환 후 String으로 반환		
		String sDate=sdf.format(cal.getTime());
		//String -> Date로 변환
		Date eDate=Date.valueOf(sDate);
		//vo에 만료일 설정
		bVo.setBlack_expiry_date(eDate);
		bService.enrollBlackList(user_id, bVo);
		
	
		return "/";
	}
	
	@RequestMapping("/disenrollBlack")	
	public String disenrollBlackList(String user_id) {
		uService.unBlackUser(user_id);
		return "/";
	}
	
	
}

