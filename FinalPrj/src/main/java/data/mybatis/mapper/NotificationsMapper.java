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
}
