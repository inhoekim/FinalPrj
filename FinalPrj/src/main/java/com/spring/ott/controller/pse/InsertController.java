package com.spring.ott.controller.pse;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.spring.ott.service.CommentsService;
import com.spring.ott.service.PostService;
import com.spring.ott.vo.CategoryVo;
import com.spring.ott.vo.CommentsVo;
import com.spring.ott.vo.PostVo;

@Controller
public class InsertController {
	@Autowired PostService service;
	@Autowired CommentsService cService;
	
	@GetMapping("/board/insert")
	public String insertForm(int category, Model m,Principal user_id) {
		String[] category_str = {"넷플릭스","왓챠", "디즈니", "전체공지"};
		List<CategoryVo> list=service.category();
		m.addAttribute("category_str", category_str[category]);
		m.addAttribute("category", category);
		m.addAttribute("list", list);
		m.addAttribute("user_id", user_id);
		
		List<PostVo> rList=service.recentPost();
		List<PostVo> bList=service.bestPost();
		List<CommentsVo> cRList=cService.recentComm();
		List<CommentsVo> cBList=cService.bestComm();
		List<PostVo> rPList = service.recent_findParty();
		
		m.addAttribute("rPList", rPList);
		m.addAttribute("bList", bList);
		m.addAttribute("rList", rList);
		m.addAttribute("cBList", cBList);
		m.addAttribute("cRList", cRList);
		
		
		return "board/insert.tiles";
	}
	@PostMapping("/board/insert")
	public String insert(PostVo vo ,Model m,Principal user_id) {
		System.out.println(vo);
		vo.setUser_id(user_id.getName());
		service.postInsert(vo);
		String url = "/board/list?category=" + vo.getCategory_id() + "&subcate=" + vo.getSubcate();
		return "redirect:" + url;
	}
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println(fileRoot);
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		System.out.println(savedFileName);
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", request.getContextPath()+"/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
			System.out.println("성공");
				
		} catch (IOException e) {
			System.out.println("실패");
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}
}
