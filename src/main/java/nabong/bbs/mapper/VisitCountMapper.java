package nabong.bbs.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import nabong.bbs.vo.VisitCountVo;

@Mapper("visitCountMapper")
public interface VisitCountMapper  {

	public void setTotalCount() throws Exception;
	
	public int getTotalCount()throws Exception;
	
	public int getTodayCount()throws Exception;
	
	public int getDateCount(String date)throws Exception;

	public List<VisitCountVo> getTime() throws Exception;

}
