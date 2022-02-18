package data.mybatis.mapper;

import com.spring.ott.vo.ProfileImgVo;
import com.spring.ott.vo.UserProfileVo;

public interface ProfileImgMapper {
	ProfileImgVo selectProfile(int profile_id);
	UserProfileVo userProfile(String user_id);
}
