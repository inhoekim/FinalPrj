package data.mybatis.mapper;

import java.util.List;
import com.spring.ott.vo.VisiterVo;

public interface VisiterMapper {
	int insert(String ip_address);
	public List<VisiterVo> onedayselect(String visit_date);
	public List<VisiterVo> rankingselect(String visit_date);
	public int onedaylog(String visit_date);
	
}