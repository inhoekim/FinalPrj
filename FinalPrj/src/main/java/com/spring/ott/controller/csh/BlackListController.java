package com.spring.ott.controller.csh;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.ott.service.AccusationService;
import com.spring.ott.service.BlackListManiService;
import com.spring.ott.service.BlackListService;
import com.spring.ott.service.UserService;
import com.spring.ott.vo.AccusationVo;
import com.spring.ott.vo.BlackListVo;

@Controller
public class BlackListController {
	@Autowired AccusationService accService;
	@Autowired BlackListManiService bmService;
	@Autowired UserService uService;
	@Autowired BlackListService bService;
	
	@RequestMapping("/enrollBlack")
	public String enrollBlackList(int accusate_id, int result, String user_id, BlackListVo bVo, int n)//n일 가져오기
	{		
		/* 추가 */
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("accusate_id", accusate_id);
		map.put("result", result);
		accService.updateOne(map);
		if(result == 2) {
			return "redirect:/board/accusation";
		}
		/* end */
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

		bmService.enrollBlackList(user_id, bVo);
		return "redirect:/board/accusation";
	}
	
	@RequestMapping("/disenrollBlack")	
	public String disenrollBlackList(String user_id) {
		uService.unBlackUser(user_id);
		return "/";
	}
	
	@Scheduled(cron="0 1 0 * * *") // 매일 0시1분에 실행되도록.
	public void doExpireBlack() {
		System.out.println("스케줄러 동작중");
		//blacklist 읽어오기
		List<BlackListVo> expList=bService.selectExpDate();
		 
		//오늘 날짜 받아오기
		LocalDate now=LocalDate.now();
		Date nDate=Date.valueOf(now); 
		System.out.println("########현재 날짜######## : " + nDate);
		
		//오늘 날짜랑 같으면 블랙해제
		for(int i=0;i<expList.size();i++) {
			System.out.println("########만료일 리스트######## : " + expList.get(i).getBlack_expiry_date());
			
			if(expList.get(i).getBlack_expiry_date().equals(nDate)) {
				uService.unBlackUser(expList.get(i).getUser_id());
				System.out.println("해제 완료");
			}else {
				System.out.println("해제 없음");
			}
		}
	}
	
	
	
}

