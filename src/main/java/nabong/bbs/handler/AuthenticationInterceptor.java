package nabong.bbs.handler;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import nabong.bbs.service.VisitCountService;
import nabong.bbs.vo.PageVo;
import nabong.bbs.vo.VisitCountVo;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	VisitCountService service;
	
	VisitCountVo vo = new VisitCountVo();
	PageVo pageVo = new PageVo();
	
	//  인증 체크가 필요 한 URL 리스트  
	/* /myPage.do /login.do /join.do /Talk/review/write.do /Talk/photo/write.do */
	List<String> urls;
 
	public void setUrls(List urls) {
		this.urls = urls;
	}
	
	InetAddress local;
	public String getIp() throws UnknownHostException{
		local = InetAddress.getLocalHost(); 
		String visitIp = local.getHostAddress(); 
	    return visitIp;
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
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		System.out.println("== URL : "+ request.getRequestURI() +" ============================");
			System.out.println("local ip : "+ getIp());
		//dispatcher-servlet의 value와 홈페이지가 일치하는 경우 세션이 없으면 접근 불가
		for(int i=0; i < urls.size(); i++){
			if (request.getRequestURI().matches(urls.get(i)) && userId == null) {
				System.out.println("== return false ============================");
				response.sendRedirect("/login.do");
				return false;
			}
		}
		//동일한 ip가 아닐 경우 방문자 수 추가
		if(service.check(getIp()) == 0) {
			vo.setVisitIp(getIp());
			service.setTotalCount(vo);
		}
		if(userId != null) {
			pageVo.setUserId(userId);
			service.setLastLogin(pageVo);
			System.out.println(userId + "님 최종 접속일자 수정");
		}
		return true;
	}
	
	
	
}
