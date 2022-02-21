package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.MatchingVo;
import com.spring.ott.vo.MemberVo;

public interface MatchingMapper {
	int updatePayment(HashMap<String, Object> map);
	int insert(HashMap<String, Object> map);
	int delete(HashMap<String, Object> map);
	int deleteAll(int party_id);
	MatchingVo matchingCheck(String user_id);
	List<MatchingVo> memberList(int party_id);
	List<MemberVo> selectMember(int party_id);
	MatchingVo selectByPayment(String payment_id);
}
