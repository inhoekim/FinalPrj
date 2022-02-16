package data.mybatis.mapper;

import java.util.List;

import com.spring.ott.vo.AccusationVo;

public interface AccusationMapper {
	List<AccusationVo> selectList();
	int postAccusation(AccusationVo vo);
	int commentAccusation(AccusationVo vo);
}
