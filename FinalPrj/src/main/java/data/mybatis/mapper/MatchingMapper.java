package data.mybatis.mapper;

import java.util.HashMap;

public interface MatchingMapper {
	int insert(HashMap<String, Object> map);
	int delete(HashMap<String, Object> map);
}
