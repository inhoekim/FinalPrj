package data.mybatis.mapper;

import com.spring.ott.vo.PartyVo;

public interface PartyMapper {
	int insertParty(PartyVo vo);
	PartyVo getMyParty(int ott_id);
	PartyVo checkInvite(String invite_code);
	PartyVo matchingCheck(String user_id);
}
