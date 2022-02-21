package data.mybatis.mapper;


import java.util.List;

import com.spring.ott.vo.BlackListVo;

public interface BlackListMapper {
	public List<BlackListVo> blackList();
	public List<BlackListVo> selectExpDate();
	public int blackListInsert(BlackListVo vo);
}
