package com.spring.ott.chat.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.spring.ott.chat.handler.SocketHandler;
import com.spring.ott.chat.service.ChatService;
import com.spring.ott.chat.vo.ChatMembersVo;
import com.spring.ott.chat.vo.ChatMessageVo;
import com.spring.ott.chat.vo.ChatRoomjoinVo;

import data.mybatis.mapper.ChatMapper;

@Controller
public class ChatController {
	//@Autowired private ChatMapper service;
	@Autowired private ChatService service;
	@Autowired private SocketHandler sockethandler;
	
	@RequestMapping(value="/chat_main", method= RequestMethod.GET)
	public ModelAndView chat_Form(HttpServletRequest req, HttpServletResponse resp,Principal p) {
		ModelAndView mv=new ModelAndView("chat/chat_main");
		HttpSession session=req.getSession();
		
		//String user_id=(String)session.getAttribute("user_id");
		String user_id = p.getName();
		System.out.println("세션user_id : " + user_id);
		//String sid = "test2";
		//본인 프로필 불러오기
		if(user_id.equals("admin")) {
			ChatMembersVo vo=service.member(user_id);
			mv.addObject("vo", vo);
			List<ChatMembersVo> list = service.list();
			System.out.println(list);
			mv.addObject("list",list);
		} else {
			ChatMembersVo vo=service.member(user_id);
			mv.addObject("vo", vo);
			List<ChatMembersVo> list = new ArrayList<>();
			ChatMembersVo vo1=service.member("admin");
			list.add(vo1);
			mv.addObject("list",list);
		}
		
		//날짜 형식 변경
		//SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//String strNowDate = simpleDateFormat.format(vo.getCmbirth());
		
		//List<ChatMembersVo> list=service.chat_add_check(null);
		//List<ChatMembersVo> list = service.list();
		//mv.addObject("list",list);
		//mv.addObject("strNowDate",strNowDate);
		//mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/chat_room1", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_room1(String user_id){
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> countmap=new HashMap<String, Object>();
		List<HashMap<String, Object>> countlist=new ArrayList<HashMap<String,Object>>();
		List<String> chat_rank=service.chat_rank(user_id);
		for (int i=0; i<chat_rank.size(); i++) {
			String crid = chat_rank.get(i);
			countmap=service.count(crid);
			countlist.add(countmap);
		}
		map.put("countlist", countlist);
		return map;
	}
	
	@RequestMapping(value="/chat_room2", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_room2(String user_id, String crid){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("crid", crid);
		List<ChatRoomjoinVo> list=service.roomjoin(map);
		List<ChatMessageVo> list2=service.chat_message_recently(crid);
		//안읽은 메세지 개수 구하기
		int notread=service.chat_msg_notread(map);
		
		HashMap<String, Object> listmap=new HashMap<String, Object>();
		
		
		listmap.put("list", list);
		listmap.put("list2", list2);
		listmap.put("notread", notread);
		return listmap;
	}
	@RequestMapping(value="/chating_check", method= RequestMethod.GET)
	public ModelAndView chating_check(String user_id, String cbbuid, String profile_id, String name) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		ModelAndView mv=new ModelAndView("chat/chat_room");
		int cnt=0;
		int crid=0;
		boolean check=false; //방여부 체크
		//user_id=본인아이디, cbbuid=친구아이디
		HashMap<String, Object> checkmap=new HashMap<String, Object>();
		checkmap.put("user_id", user_id);
		checkmap.put("cbbuid", cbbuid);
		List<ChatRoomjoinVo> roomcheck=service.roomcheck(checkmap);
		if(roomcheck.isEmpty()) {
			//검색결과 아무것도 없을경우
			check=true;
		}
		if(check==false) {
			check=true;
			//검색결과는 있으나 2명이상 방일경우(신규생성가능)
			for(ChatRoomjoinVo vo:roomcheck) {
				//cnt=service.roomcheck_cnt(vo.getCrid());
				if(cnt==2) {
					crid=vo.getCrid();
					check=false;
					break;
				}
			}
		}

		if(check==true) {
			//새로 방 생성
			int n1=service.chat_room_insert();
			//방금 생성한 시퀀스 번호 확인(방번호)
			crid=service.room_seq();
			HashMap<String, Object> roomjoin=new HashMap<String, Object>();
			roomjoin.put("user_id",user_id);
			roomjoin.put("crid",crid);
			//user_id=본인아이디로 된 roomjoin생성
			int n2=service.chat_roomjoin_insert(roomjoin);
			roomjoin.put("user_id", cbbuid);
			//cbbuid=친구아이디로 된 roomjoin생성
			int n3=service.chat_roomjoin_insert(roomjoin);
			
			//방생성시 시스템 메세지 발송
			//본인입장
			ChatMessageVo sysvo1=new ChatMessageVo(0, null, null, name+"님이 입장하셨습니다.", user_id, crid, null, null, 0);
			//친구입장
			ChatMembersVo cmvo=service.member(cbbuid);
			ChatMessageVo sysvo2=new ChatMessageVo(0, null, null, cmvo.getName()+"님이 입장하셨습니다.", cbbuid, crid, null, null, 0);
			int sysmsg1=service.chat_message_system(sysvo1);
			int sysmsg2=service.chat_message_system(sysvo2);
			if(sysmsg1==0 || sysmsg2==0) {
				System.out.println("시스템 메세지 오류");
			}
			
			if(n1==0 && n2==0 && n3==0) {
				System.out.println("방생성 오류발생");
			}
			mv.addObject("user_id",user_id);//본인아이디 전송
			mv.addObject("profile_id", profile_id);//본인 프로필 전송
			mv.addObject("name",name);//본인 이름 전송
			mv.addObject("crid",crid);//방번호 전송
		}else if(check==false) {
			//기존에 있던 방 열기
			mv.addObject("user_id",user_id);//본인아이디 전송
			mv.addObject("profile_id", profile_id);//본인 프로필 전송
			mv.addObject("name",name);//본인 이름 전송
			mv.addObject("crid",crid);//방번호 전송
		}
		return mv;
	}
	
	@RequestMapping(value="/chating_room", method= RequestMethod.GET)
	public ModelAndView chating_room(String user_id, String crid, String profile_id, String name) {
		ModelAndView mv=new ModelAndView("chat/chat_room");
		mv.addObject("user_id",user_id);//본인아이디 전송
		mv.addObject("profile_id", profile_id);//본인 프로필 전송
		mv.addObject("name",name);//본인 이름 전송
		mv.addObject("crid",crid);//방번호 전송
		return mv;
	}
	
	@RequestMapping(value="/messagelist", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> messagelist(String crid){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int crid1=Integer.parseInt(crid);
		List<ChatMessageVo> list=service.chat_message_list(crid1);
		map.put("list", list);
		return map;
	}

	@RequestMapping(value="/chat_exit", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_exit(String crid, String user_id,String name){
		HashMap<String, Object> map=new HashMap<String, Object>();
		int crid1=Integer.parseInt(crid);
		//시스템 메세지 보내기
		String msgsysmsg=name+"님이 나가셨습니다.";
		ChatMessageVo msgvo=new ChatMessageVo(0, null, null,msgsysmsg, user_id, crid1, null, null, 0);
		int n=service.chat_message_system(msgvo);
		//채팅메세지 테이블에서 아이디 unknown으로 변경
		HashMap<String, Object> exitmap=new HashMap<String, Object>();
		exitmap.put("user_id", user_id);
		exitmap.put("crid", crid);
		int n1=service.chat_exit(exitmap);
		//채팅방연결 테이블에서 아이디 unknown으로 변경
		int n2=service.chat_exit_join(exitmap);
		if(n==0 && n1==0 && n2==0) {
			System.out.println("채팅방 나가기 작업 실패!");
			map.put("code", "fail");
		}else {
			map.put("code", "success");
			map.put("msgsysmsg", msgsysmsg);
		}
		return map;
	}
	
	
	@RequestMapping(value="/chat_close", produces = {MediaType.APPLICATION_JSON_VALUE})
	public @ResponseBody HashMap<String, Object> chat_close(String user_id, String crid){
		HashMap<String, Object> closemap=new HashMap<String, Object>();
		HashMap<String, Object> map=new HashMap<String, Object>();
		//System.out.println(user_id);
		closemap.put("user_id", user_id);
		closemap.put("crid", crid);
		int n=service.chat_close(closemap);
		if(n>0) {
			map.put("code", "success");
		}else {
			map.put("code", "fail");
		}
		return map;
	}
	
}
