package data.mybatis.mapper;

import com.spring.ott.vo.PartyVo;

public interface PartyMapper {
	int createParty();
	PartyVo getMyParty(int ott_id);
}
