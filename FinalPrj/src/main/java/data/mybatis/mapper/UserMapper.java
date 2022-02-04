package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.security.csh.FinalUserDetail;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.UserVo;

public interface UserMapper {
	FinalUserDetail getAuths(String user_id);
	int insertUser(UserVo vo);
	int insertAuth(AuthoritiesVo vo);
	int updateUser(UserVo vo);
	int deleteUser(String user_id);
	UserVo selectUser(String user_id);
	
	public List<UserVo> UserList(HashMap<String, Integer>map);
	public int totalRowCnt();
	public List<UserVo> AllSelect();
}
