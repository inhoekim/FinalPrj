package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.chat.vo.ChatMembersVo;
import com.spring.ott.chat.vo.ChatMessageVo;
import com.spring.ott.chat.vo.ChatRoomjoinVo;

public interface ChatMapper {
	ChatMembersVo member(String cmid);
	//List<ChatMembersVo> buddy(String cmid);
	List<ChatRoomjoinVo> roomjoin(HashMap<String, Object> map);
	List<ChatMessageVo> chat_message_recently(String crid);
	HashMap<String, Object> count(String crid);
	List<ChatRoomjoinVo> roomcheck(HashMap<String, Object> map);
	//int roomcheck_cnt(int crid);
	int chat_room_insert();
	int room_seq();
	int chat_roomjoin_insert(HashMap<String, Object> map);
	int chat_message_system(ChatMessageVo vo);
	int chat_message_insert(ChatMessageVo vo);
	List<ChatMessageVo> chat_message_list(int crid);
	List<String> chat_rank(String cmid);
	int delete(HashMap<String, Object> map);
	int chat_exit(HashMap<String, Object> map);
	int chat_exit_join(HashMap<String, Object> map);
	List<ChatMembersVo> chat_add_check(HashMap<String, Object> map);
	int chat_close(HashMap<String, Object> map);
	int chat_msg_notread(HashMap<String, Object> map);
	
	List<ChatMembersVo> list();
}
