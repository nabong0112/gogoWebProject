package nabong.bbs.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import nabong.bbs.service.VisitCountService;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	VisitCountService service;
	
	//  인증 체크가 필요 없는 URL 리스트  
	List<String> urls;
 
	public void setUrls(List urls) {
		this.urls = urls;
	}

	/**
	 * 클라이언트 요청이 처리된 뒤 클라이언트 뷰를 통해 응답을 전송하고 실행한다. postHandle이 실행되지 않을때애도 얘는 실행 된다.
	 * **/
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
	
	/**
	 * 비동기 요청하는것 이걸 하면 postHandle와 afterCompletion 은 실행되지 않고, 이 메소드가 실행됨
	 * */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	/**
	 * 클라이언트의 요청을 처리한 뒤에 호출되는것 컨트롤러에서 예외가 발생하면 실행되지 않음
	 * */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
        System.out.println("== 인터셉터 종료 ============================");
	}
	
	/**
	 * 클라이언트의 요청을 컨트롤러에 전달하기 전에 호출되는것 false를 리턴하면 다음 내용은 실행하지 않음
	 * */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("userId");
		System.out.println("== URL : "+ request.getRequestURI() +" ============================");
        //dispatcher-servlet의 value와 홈페이지가 일치하는 경우 세션이 없으면 접근 불가
		for(int i=0; i < urls.size(); i++){
            if (request.getRequestURI().matches(urls.get(i)) && obj == null) {
        			System.out.println("== 로그인이 필요한 URL ============================");
                    System.out.println("== URL : "+ request.getRequestURI() +" ============================");
                    System.out.println("== return false ============================");
        			response.sendRedirect("/login.do");
        			return false;
            }else {
            	return true;
            }
		}
		
		return true;
	}
	
	
	
}
