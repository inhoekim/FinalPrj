package data.mybatis.mapper;

import com.spring.ott.vo.FilesVo;
import com.spring.ott.vo.PostVo;

public interface PostMapper {
	int postInsert(PostVo vo);
	int FileInsert(FilesVo vo);
}
