package data.mybatis.mapper;

import com.spring.ott.security.csh.FinalUserDetail;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.UserVo;

public interface UserMapper {
	FinalUserDetail getAuths(String user_id);
	int insertUser(UserVo vo);
	int insertAuth(AuthoritiesVo vo);
}
