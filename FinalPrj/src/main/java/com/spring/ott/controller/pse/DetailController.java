package com.spring.ott.controller.pse;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.service.VoteService;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;
import com.spring.ott.vo.UserProfileVo;
import com.util.PageUtil;

@Controller
public class DetailController {
	@Autowired PostService service;
	@Autowired CommentsService cService;
	@Autowired VoteService voteService;
	
	@GetMapping("/board/detail")
	public String detail(@RequestParam(value="pageNum",defaultValue = "1") int pageNum,
			@RequestParam(value="subcate",defaultValue = "0") int subcate,
			int post_id, int category,Model model,String field,String keyword) {
		service.addHit(post_id);
		PostVo postVo= service.postDetail(post_id);
		List<UserProfileVo> profiles = voteService.getLikeList(post_id);
		model.addAttribute("postVo", postVo);
		model.addAttribute("profiles", profiles);
		
		/* 하단 boardList 배치 */
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
		return "board/boardDetail.tiles";
	}
	
	@RequestMapping(value ="/commList",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> getComm(int post_id) {
		System.out.println(post_id+"받음");
		List<CommentsVo> list=cService.selectAll(post_id);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("list", list);
		
		return map;
	}
	@RequestMapping(value ="/userwriteList",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public HashMap<String, Object> getwriteList(String user_id){
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<PostVo> plist=service.userPost(user_id);
		List<CommentsVo> clist=service.userComment(user_id);
		map.put("plist", plist);
		map.put("clist", clist);
		return map;
	}
}
