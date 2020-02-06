package nabong.bbs.controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class EgovLoginController {
	
	@RequestMapping(value="/uat/uia/mail.do",produces = "application/text; charset=utf8", method=RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException {
		JavaMailSenderImpl mailSender= new JavaMailSenderImpl();
		Random r = new Random();
		int dice= r.nextInt(4589362);
	
		String setfrom = "kiidb369@naver.com";
		String tomail = request.getParameter("email");
		String title = "본인인증 이메일입니다.";
		String content = 
				System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"본인 확인 이메일입니다."
				+System.getProperty("line.separator")+
				System.getProperty("line.separator")+
				"인증번호는" +dice+"입니다.";
		
		try {
			MimeMessage message= mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch( Exception e) {
			System.out.println(e);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cmm/uat/uia/email_injeung");
		mv.addObject("dice", dice);
		
		System.out.println("mv : "+mv);
		
		/*response_email.setContentType("charset=UTF-8");*/
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일발송.');</script>");
		out_email.flush();
		
		return mv;
	}
	
	@RequestMapping("/uat/uia/email.do")
	public String email() {
		return "cmm/uat/uia/email";
	}
	
	@RequestMapping(value = "/uat/uia/injeung{dice}.do", method = RequestMethod.POST)
	public ModelAndView signemail(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
		
		System.out.println("마지막 : email_injung:" +email_injeung);
		System.out.println("마지막 : dice :"+dice);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("cmm/uat/uia/sign");
		mv.addObject("email", email_injeung);
		
		if (email_injeung.equals(dice)) {
			
			mv.setViewName("cmm/uat/uia/sign");
			mv.addObject("email", email_injeung);
			
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals=response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치합니다. 창으로이동합니다.'); </script>");
			out_equals.flush();
			return mv;
			
		} else if(email_injeung != dice) {
			
			ModelAndView mv2 = new ModelAndView();
			
			mv2.setViewName("cmm/uat/uia/email_injeung");
			
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals= response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	        return mv2;
		}
		return mv;
	
	}

}