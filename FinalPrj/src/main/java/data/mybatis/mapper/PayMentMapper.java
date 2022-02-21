package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.PayMentVo;

public interface PayMentMapper {
	boolean PayMentInsert(PayMentVo vo);
	List<PayMentVo> PayList(HashMap<String, Integer>map);
	int totalRowCnt();
	List<PayMentVo> AllSelect();
	boolean payupdate(String payment_id);
}
