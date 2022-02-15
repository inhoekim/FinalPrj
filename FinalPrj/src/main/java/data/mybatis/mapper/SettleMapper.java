package data.mybatis.mapper;

import java.util.HashMap;

import com.spring.ott.vo.SettleVo;

public interface SettleMapper {
	int insert(SettleVo vo);
	SettleVo selectSettle(HashMap<String, Object> map);
	int cancleSettle(int party_id);
}
