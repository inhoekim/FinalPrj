package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.UserProfileVo;
import com.spring.ott.vo.VoteVo;

public interface VoteMapper {
	int insertPostLike(VoteVo vo);
	int insertCommLike(VoteVo vo);
	int deleteLike(HashMap<String, Object> map);
	VoteVo checkLike(HashMap<String, Object> map);
	int likeCount(int post_id);
	VoteVo checkComm(HashMap<String, Object> map);
	int deleteCommLike(HashMap<String, Object> map);
	List<UserProfileVo> getLikeList(int post_id);
	int delete(int comment_id);
	int delPostVote(int post_id);
}
