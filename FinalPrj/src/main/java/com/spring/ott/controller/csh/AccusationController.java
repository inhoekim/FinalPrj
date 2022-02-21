package com.spring.ott.controller.csh;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ott.service.AccusationService;
import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.AccusationVo;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;
import com.util.PageUtil;

@Controller
public class AccusationController {
	@Autowired private ServletContext servletContext;
	@Autowired AccusationService accService;
	@Autowired PostService service;
	@Autowired CommentsService cService;
	
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
		
		List<PostVo> rList=service.recentPost();
		List<PostVo> bList=service.bestPost();
		List<CommentsVo> cRList=cService.recentComm();
		List<CommentsVo> cBList=cService.bestComm();
		
		model.addAttribute("bList", bList);
		model.addAttribute("rList", rList);
		model.addAttribute("cBList", cBList);
		model.addAttribute("cRList", cRList);
		
		
		return "board/accusationList.tiles";
	}
	
	@PostMapping("/board/accusation")
	public String accInsert(AccusationVo vo,Model model,int pageNum, int subcate,int post_id,int category,String field,String keyword) {
		accService.postAccusation(vo);
		model.addAttribute("msg", "신고접수를 완료하였습니다.");
		String param = "post_id="+ post_id + "&pageNum=" + pageNum +"&field=" + field + "&keyword=" + keyword +
				"&category=" + category + "&subcate=" + subcate;
		model.addAttribute("url", servletContext.getContextPath() + "/board/detail?" + param);
		return "home/alert";
	}

}