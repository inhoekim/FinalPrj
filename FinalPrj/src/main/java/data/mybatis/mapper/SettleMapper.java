package data.mybatis.mapper;

import com.spring.ott.vo.SettleVo;

public interface SettleMapper {
	int insert(SettleVo vo);
	SettleVo select(String target_id);
}
