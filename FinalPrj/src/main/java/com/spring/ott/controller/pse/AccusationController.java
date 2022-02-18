package com.spring.ott.controller.pse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ott.service.AccusationService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.AccusationVo;
import com.spring.ott.vo.PostVo;
import com.util.PageUtil;

@Controller
public class AccusationController {
	@Autowired AccusationService accService;
	
	@RequestMapping("/board/accusation")
	public String list(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			Model model,String field,String keyword) {
		HashMap<String , Object> map =new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword", keyword);

		int page_row = 5;
		int totalRowCount=accService.count(map);
		int totalPage = totalRowCount / page_row + 1;
		if(pageNum <= 0) pageNum = 1;
		else if (pageNum > totalPage) pageNum = totalPage;
		PageUtil pu=new PageUtil(pageNum, page_row, 5, totalRowCount);
		int startRow=pu.getStartRow();//시작행번호
		int endRow=pu.getEndRow();//끝행번호
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		List<AccusationVo> list=accService.selectList(map);
		
		String[] acc_str = {"혐오발언","음란물게시", "광고", "기타"};
		String[] result_str = {"처리대기","정지처분", "오신고"};
		model.addAttribute("field",field);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		model.addAttribute("acc_str", acc_str);
		model.addAttribute("result_str",result_str);
		
		return "board/accusationList.tiles";
	}
}