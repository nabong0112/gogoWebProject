package nabong.bbs.service;

import java.util.List;

import nabong.bbs.vo.PageVo;
import nabong.bbs.vo.VisitCountVo;

public interface VisitCountService {
	//총 방문자 수 증가
	public void setTotalCount(VisitCountVo vo) throws Exception;
	//총 방문자 수 반환
	public int getTotalCount() throws Exception;
	//오늘 방문자 수 반환
	public int getTodayCount() throws Exception;
	//날짜별 방문자수 반환
	public int getDateCount(String date) throws Exception;
	
	public List<VisitCountVo> getTime() throws Exception;
	//체크
	public int check(VisitCountVo vo) throws Exception;
	//최종 방문 날짜(회원전용)수정 
	public void setLastLogin(String userId) throws Exception ;
	//주간 통계
	public List<VisitCountVo> statistic() throws Exception;
	//남녀성비
	public VisitCountVo selectJender() throws Exception;
	

}
