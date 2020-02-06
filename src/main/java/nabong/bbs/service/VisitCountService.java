package nabong.bbs.service;

import java.util.List;

import nabong.bbs.vo.VisitCountVo;

public interface VisitCountService {
	//총 방문자 수 증가
	public void setTotalCount() throws Exception;
	//총 방문자 수 반환
	public int getTotalCount() throws Exception;
	//오늘 방문자 수 반환
	public int getTodayCount() throws Exception;
	//날짜별 방문자수 반환
	public int getDateCount(String date) throws Exception;
	
	public List<VisitCountVo> getTime() throws Exception;
	

}
