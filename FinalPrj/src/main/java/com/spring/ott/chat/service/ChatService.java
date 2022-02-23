package com.spring.ott.chat.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ott.chat.vo.ChatMembersVo;
import com.spring.ott.chat.vo.ChatMessageVo;
import com.spring.ott.chat.vo.ChatRoomjoinVo;

import data.mybatis.mapper.ChatMapper;

@Service
public class ChatService {
	@Autowired private ChatMapper mapper;
	public ChatMembersVo member(String user_id) {
		return mapper.member(user_id);
	}
	public List<ChatRoomjoinVo> roomjoin(HashMap<String, Object> map){
		return mapper.roomjoin(map);
	}
	public List<ChatMessageVo> chat_message_recently(String crid){
		return mapper.chat_message_recently(crid);
	}
	public HashMap<String, Object> count(String crid){
		return mapper.count(crid);
	}
	public List<ChatRoomjoinVo> roomcheck(HashMap<String, Object> map) {
		return mapper.roomcheck(map);
	}
	public int chat_room_insert() {
		return mapper.chat_room_insert();
	}
	public int room_seq() {
		return mapper.room_seq();
	}
	public int chat_roomjoin_insert(HashMap<String, Object> map) {
		return mapper.chat_roomjoin_insert(map);
	}
	public int chat_message_system(ChatMessageVo vo) {
		return mapper.chat_message_system(vo);
	}
	public int chat_message_insert(ChatMessageVo vo) {
		return mapper.chat_message_insert(vo);
	}
	public List<ChatMessageVo> chat_message_list(int crid){
		return mapper.chat_message_list(crid);
	}
	public List<String> chat_rank(String user_id){
		return mapper.chat_rank(user_id);
	}
	public int delete(HashMap<String, Object> map) {
		return mapper.delete(map);
	}
	public int chat_exit(HashMap<String, Object> map) {
		return mapper.chat_exit(map);
	}
	public int chat_exit_join(HashMap<String, Object> map) {
		return mapper.chat_exit_join(map);
	}
	public List<ChatMembersVo> chat_add_check(HashMap<String, Object> map){
		return mapper.chat_add_check(map);
	}
	public int chat_close(HashMap<String, Object> map) {
		return mapper.chat_close(map);
	}
	public int chat_msg_notread(HashMap<String, Object> map) {
		return mapper.chat_msg_notread(map);
	}
	
	public List<ChatMembersVo> list() {
		return mapper.list();
	}
}
