package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.NotificationsVo;

public interface NotificationsMapper {
	List<NotificationsVo> selectAll(String user_id);
	int postNoti(NotificationsVo vo);
	int commNoti(NotificationsVo vo);
	int delete(HashMap<String, Object> map);
	int deleteCommNoti(HashMap<String, Object> map);
	int deleteComm(int comment_id);
	int delPostNoti(int post_id);
	int deluserNoti(String user_id);
	int delNoid(int notify_id);
	int cnt(String user_id);
}
