package data.mybatis.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.WatingRoomVo;

public interface WatingRoomMapper {
	List<WatingRoomVo> getWatingRow(int ott_id);
	int deleteRow(String user_id);
	int enroll(HashMap<String, Object> map);
	int enrollFirst(HashMap<String, Object> map);
	WatingRoomVo matchingCheck(String user_id);
	Date earliestDate();
}
