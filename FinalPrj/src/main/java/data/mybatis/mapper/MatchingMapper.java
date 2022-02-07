package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.MatchingVo;

public interface MatchingMapper {
	int insert(HashMap<String, Object> map);
	int delete(HashMap<String, Object> map);
	MatchingVo matchingCheck(String user_id);
	List<MatchingVo> memberList(int party_id);
}
