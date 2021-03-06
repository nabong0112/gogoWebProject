package nabong.bbs.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import javax.annotation.Resource;
import javax.naming.NamingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import nabong.bbs.mapper.PageMapper;
import nabong.bbs.mapper.VisitCountMapper;
import nabong.bbs.service.VisitCountService;
import nabong.bbs.vo.PageVo;
import nabong.bbs.vo.VisitCountVo;

@Service("visitCountService")
public class VisitCountServiceImpl extends EgovAbstractServiceImpl implements VisitCountService{
	// extends EgovAbstractServiceImpl : No bean named 'leaveaTrace' available
		@Resource(name = "visitCountMapper")
		private VisitCountMapper visitCountMapper;
		
		//총 방문자 수 증가
	    @Override
		public void setTotalCount(VisitCountVo vo) throws Exception{
	    	visitCountMapper.setTotalCount(vo);
		}
	    
		//총 방문자 수 반환
	    @Override
		public int getTotalCount() throws Exception {
	    	return visitCountMapper.getTotalCount();
		}
	    
		//오늘 방문자 수 반환
	    @Override
		public int getTodayCount() throws Exception {
			return visitCountMapper.getTodayCount();
		}
		
		//날짜별 방문자 수 반환
	    @Override
		public int getDateCount(String date) throws Exception {
			return visitCountMapper.getDateCount(date);
		}
	    
	    @Override
		public List<VisitCountVo> getTime() throws Exception {
			return visitCountMapper.getTime();
		}
	    
	    @Override
		public int check(VisitCountVo vo) throws Exception {
			return visitCountMapper.check(vo);
		}

		@Override
		public void setLastLogin(String userId) throws Exception  {
			visitCountMapper.setLastLogin(userId);
			
		}
		
		 @Override
			public List<VisitCountVo> statistic() throws Exception {
				return visitCountMapper.statistic();
			}
		 
		 @Override
			public VisitCountVo selectJender() throws Exception {
			 VisitCountVo vo = new VisitCountVo();
			 	vo.setTotalMale(Integer.toString(visitCountMapper.selectMale()));
			 	vo.setTotalFemale(Integer.toString(visitCountMapper.selectFemale()));
				return vo;
			}
	    
	    
	
}
