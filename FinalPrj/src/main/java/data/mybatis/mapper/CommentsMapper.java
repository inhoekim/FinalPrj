package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.CommentsVo;

public interface CommentsMapper {
	List<CommentsVo> selectAll(int post_id);
	int getNum();
	int addStep(HashMap<String, Object> map);
	int insertComment(CommentsVo vo);
	int insertReComment(CommentsVo vo);
	int reCheck(int ref);
	CommentsVo selectComm(int comment_id);
	int getCount(int post_id);
	int delete(int comment_id);
	int update(CommentsVo vo);
	int selref(int ref);
	int selreff(int comment_id);
	int delPost(int post_id);
	List<CommentsVo> bestComm();
	List<CommentsVo> recentComm();
}
