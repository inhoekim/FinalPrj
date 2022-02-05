package data.mybatis.mapper;

import com.spring.ott.vo.PartyVo;

public interface PartyMapper {
	int insertParty(PartyVo vo);
	PartyVo getMyParty(int ott_id);
	PartyVo checkParty(String invite_code);
}
