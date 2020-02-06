package nabong.bbs.service;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import nabong.bbs.listener.VisitSessionListener;
import nabong.bbs.service.impl.VisitCountServiceImpl;

@Configuration
/*@ComponentScan(basePackageClasses=VisitSessionListener.class)*/
public class ServiceFactory {
	
	@Bean
	public VisitCountService visitCountService() {
		
		return new VisitCountServiceImpl();
	}
	
	/*@Bean
	public VisitCountService realVisitCountService() {
		
		return new VisitCountServiceImpl(null);
	}*/

}
