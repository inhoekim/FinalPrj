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
	public List<VisiterVo> membercount1();
	public List<VisiterVo> membercount2();
	public List<VisiterVo> membercount3();
	public List<VisiterVo> membercount4();
	public List<VisiterVo> membercount5(String visit_date,String visit_date1);
	public List<VisiterVo> membercount6();
	public List<VisiterVo> membercount7();
}