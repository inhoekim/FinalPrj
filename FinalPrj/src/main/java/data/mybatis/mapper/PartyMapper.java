package data.mybatis.mapper;

import java.util.HashMap;

import com.spring.ott.vo.PartyVo;

public interface PartyMapper {
	int insertParty(PartyVo vo);
	PartyVo getMyParty(int ott_id);
	PartyVo checkInvite(String invite_code);
	PartyVo matchingCheck(String user_id);
	PartyVo selectParty(int party_id);
	int memberUpdate(HashMap<String,Object> map);
	int stateUpdate(HashMap<String,Object> map);
	int checkPaymentState();
	int weekMatching();
}
