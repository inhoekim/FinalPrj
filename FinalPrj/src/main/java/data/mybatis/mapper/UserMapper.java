package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.ott.security.csh.FinalUserDetail;
import com.spring.ott.vo.AuthoritiesVo;
import com.spring.ott.vo.MemberVo;
import com.spring.ott.vo.UserVo;

public interface UserMapper {
	FinalUserDetail getAuths(String user_id);
	int insertUser(UserVo vo);
	int insertAuth(AuthoritiesVo vo);
	int updateUser(UserVo vo);
	int deleteUser(String user_id);
	String findId(@Param("name") String name,@Param("email") String email);
	String findPwdChk(@Param("user_id") String user_id, @Param("email") String email);
	int findPwd(UserVo vo);
	UserVo selectUser(String user_id);
	MemberVo selectMember (String user_id); //김인회
	
	public List<UserVo> UserList(HashMap<String, Integer>map);
	public int totalRowCnt();
	public List<UserVo> AllSelect();
	
}
 