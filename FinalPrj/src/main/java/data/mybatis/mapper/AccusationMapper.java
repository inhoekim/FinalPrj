package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.AccusationVo;

public interface AccusationMapper {
	List<AccusationVo> selectList(HashMap<String, Object> map);
	int count(HashMap<String, Object> map);
	int postAccusation(AccusationVo vo);
}
