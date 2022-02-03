package data.mybatis.mapper;

import java.util.List;

import com.spring.ott.vo.WatingRoomVo;

public interface WatingRoomMapper {
	List<WatingRoomVo> getRow(int ott_id);
	int countRow(int ott_id);
	int deleteRow(int wating_id);
}
