package nabong.bbs.listener;

import javax.annotation.Resource;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import nabong.bbs.mapper.VisitCountMapper;
import nabong.bbs.service.ServiceFactory;
import nabong.bbs.service.impl.VisitCountServiceImpl;

@WebListener
public class VisitSessionListener implements HttpSessionListener {
	
		final static Logger logger = Logger.getLogger(VisitSessionListener.class);
		
		/*ApplicationContext context = new AnnotationConfigApplicationContext(ServiceFactory.class);
		VisitCountServiceImpl service = context.getBean("visitCountService",VisitCountServiceImpl.class);
		*/
		@Override
	    public void sessionCreated(HttpSessionEvent sessionEve) {
	        
	        // 세션이 새로 생성되면 execute() 실행한다.
	        if(sessionEve.getSession().isNew()){
	            execute(sessionEve);
	        }
	    }
	    
	    private void execute(HttpSessionEvent sessionEve) 
	    {
	       /* try {
	            // 전체 방문자 수 증가
	        	service.setTotalCount();
	            // 총 방문자 수
	            String totalCount = service.getTotalCount();
	            // 오늘 방문자 수
	            String todayCount = service.getTodayCount();
	            
	            HttpSession session = sessionEve.getSession();
	            
	            // 세션에 방문자 수를 담는다.
	           // session.setAttribute("totalCount", totalCount); 
	           session.setAttribute("todayCount", todayCount);
	        } catch (Exception e) {
	            logger.error("===== 방문자 카운터 오류 =====\n", e);
	        }*/
	    }
	    @Override
	    public void sessionDestroyed(HttpSessionEvent sessionEve) {
	    	
	    }
}
