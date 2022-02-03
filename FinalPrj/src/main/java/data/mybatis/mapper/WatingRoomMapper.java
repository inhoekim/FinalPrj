package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.WatingRoomVo;

public interface WatingRoomMapper {
	List<WatingRoomVo> getWatingRow(int ott_id);
	int deleteRow(int wating_id);
	int enroll(HashMap<String, Object> map);
}
