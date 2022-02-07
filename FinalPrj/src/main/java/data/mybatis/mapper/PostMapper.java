package data.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.ott.vo.CategoryVo;
import com.spring.ott.vo.FilesVo;
import com.spring.ott.vo.PostVo;

public interface PostMapper {
	int postInsert(PostVo vo);
	int fileInsert(FilesVo vo);
	List<PostVo> postList(HashMap<String, Object> map);
	PostVo postDetail(int post_id);
	List<PostVo> recentPost();
	List<PostVo> bestPost();
	int addHit(int post_id);
	int count(HashMap<String, Object> map);
	int delete(int post_id);
	int update(PostVo vo);
	List<CategoryVo> category();
	PostVo one(int post_id);
}
