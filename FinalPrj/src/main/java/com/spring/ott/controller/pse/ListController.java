package com.spring.ott.controller.pse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;
import com.util.PageUtil;



@Controller
public class ListController {
	@Autowired PostService service;
	@Autowired CommentsService cservice;
	
	@RequestMapping("/board/list")
	public String list(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			@RequestParam(value="subcate",defaultValue = "0") int subcate,
			int category,Model model,String field,String keyword) {
		HashMap<String , Object> map =new HashMap<String, Object>();
		System.out.println(field);
		System.out.println(keyword);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("subcate", subcate);
		map.put("category", category);
		
		int page_row = 5;
		int totalRowCount=service.count(map);
		int totalPage = totalRowCount / page_row + 1;
		if(pageNum <= 0) pageNum = 1;
		else if (pageNum > totalPage) pageNum = totalPage;
		PageUtil pu=new PageUtil(pageNum, page_row, 5, totalRowCount);
		int startRow=pu.getStartRow();//시작행번호
		int endRow=pu.getEndRow();//끝행번호
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<PostVo> list=service.postList(map);
		
		String[] subcate_str = {"전체","공지", "파티찾기", "자유", "신고"};
		String[] category_str = {"넷플릭스","왓챠", "디즈니", "전체공지"};
		String[] admin_profile = {"icon_netflix_x2.png" ,"icon_watcha_x2.png","icon_disney_x2.png"};
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		model.addAttribute("subcate_str", subcate_str);
		model.addAttribute("subcate", subcate);
		model.addAttribute("category_str", category_str);
		model.addAttribute("category", category);
		model.addAttribute("admin_profile", admin_profile[category]);
		List<PostVo> notice = service.recent_notice(category);
		model.addAttribute("notice", notice);
		
		List<PostVo> rList=service.recentPost();
		List<PostVo> bList=service.bestPost();
		List<CommentsVo> cRList=cservice.recentComm();
		List<CommentsVo> cBList=cservice.bestComm();
		List<PostVo> rPList = service.recent_findParty();
		
		model.addAttribute("rPList", rPList);
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		
		return "board/boardList.tiles";
	}
}
