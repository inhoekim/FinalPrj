package data.mybatis.mapper;

import java.util.List;
import com.spring.ott.vo.VisiterVo;

public interface VisiterMapper {
	int insert(String ip_address);
	public List<VisiterVo> onedayselect(String visit_date);
	public List<VisiterVo> alldayselect();
	public List<VisiterVo> rankingselect(String visit_date);
	public int onedaylog(String visit_date);
	
	
	//멤버 차트 
	public List<VisiterVo> memberstatus();
	public List<VisiterVo> memberage();
	public List<VisiterVo> DayCount(String visit_date);
}