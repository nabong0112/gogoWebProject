package nabong.bbs.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import nabong.bbs.vo.PageVo;
import nabong.bbs.vo.VisitCountVo;

@Mapper("visitCountMapper")
public interface VisitCountMapper  {

	public void setTotalCount(VisitCountVo vo) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public int getTodayCount() throws Exception;
	
	public int getDateCount(String date)throws Exception;

	public List<VisitCountVo> getTime() throws Exception;
	
	public int check(String visitIp) throws Exception;
	
	public void setLastLogin(PageVo pageVo) throws Exception;

	public List<VisitCountVo> statistic() throws Exception;
	
	public int selectMale() throws Exception;

	public int selectFemale() throws Exception;
}
