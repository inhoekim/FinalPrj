package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.PayMentVo;

public interface PayMentMapper {
	int PayMentInsert(PayMentVo vo);
	public List<PayMentVo> PayList(HashMap<String, Integer>map);
	public int totalRowCnt();
	public List<PayMentVo> AllSelect();
}
