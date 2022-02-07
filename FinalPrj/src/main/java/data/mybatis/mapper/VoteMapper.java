package data.mybatis.mapper;

import java.util.HashMap;


import com.spring.ott.vo.VoteVo;

public interface VoteMapper {
	int insertLike(VoteVo vo);
	int deleteLike(HashMap<String, Object> map);
	VoteVo checkLike(HashMap<String, Object> map);
	int likeCount(int post_id);
}
