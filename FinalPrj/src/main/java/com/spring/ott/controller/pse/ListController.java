package com.spring.ott.controller.pse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.spring.ott.service.PostService;
import com.spring.ott.vo.PostVo;
import com.util.PageUtil;



@Controller
public class ListController {
	@Autowired PostService service;
	
	@RequestMapping("/board/list")
	public String list(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			@RequestParam(value="subcate",defaultValue = "0") int subcate,
			int category,Model model,String field,String keyword) {
		HashMap<String , Object> map =new HashMap<String, Object>();
		System.out.println(field);
		System.out.println(keyword);
		map.put("field", field);
		map.put("keyword", keyword);
		
		int totalRowCount=service.count(map);
		System.out.println(totalRowCount);
		PageUtil pu=new PageUtil(pageNum, 5, 5, totalRowCount);
		int startRow=pu.getStartRow();//시작행번호
		int endRow=pu.getEndRow();//끝행번호
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("subcate", subcate);
		map.put("category", category);
		List<PostVo> list=service.postList(map);
		
		String[] subcate_str = {"전체","공지", "파티찾기", "자유", "신고"};
		String[] category_str = {"넷플릭스","왓챠", "디즈니", "전체공지"};
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		model.addAttribute("subcate", subcate_str[subcate]);
		model.addAttribute("category_str", category_str[category]);
		model.addAttribute("category", category);
		
		return "board/boardList.tiles";
	}
}
