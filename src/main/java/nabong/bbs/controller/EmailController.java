/*package nabong.bbs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {
	//이메일 보내기
	@RequestMapping(value="/uat/uia/mail.do",produces = "application/text; charset=utf8", method=RequestMethod.POST)
	   public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response_email) throws IOException {
	      JavaMailSenderImpl mailSender= new JavaMailSenderImpl();
	      Random r = new Random();
	      int dice= r.nextInt(4589362) + 49311;
	   
	      String setfrom = "nabong0112@naver.com";
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
	      
	      response_email.setContentType("charset=UTF-8");
	      PrintWriter out_email = response_email.getWriter();
	      out_email.println("<script>alert('인증번호가 발송되었습니다.');</script>");
	      out_email.flush();
	      
	      return mv;
	   }
	
	@RequestMapping(value = "/uat/uia/injeung{dice}.do", method = RequestMethod.POST)
	   public ModelAndView signemail(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	      int count = 0;
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
	    	  count++;
	         ModelAndView mv2 = new ModelAndView();
	         
	         mv2.setViewName("cmm/uat/uia/email_injeung");
	         
	         response_equals.setContentType("text/html; charset=UTF-8");
	         PrintWriter out_equals= response_equals.getWriter();
	         if(count == 5) {
	        	 out_equals.println("<script>alert('5회 이상 실패하셨습니다. 초기화면으로 돌아갑니다.'); history.go(-1);</script>");
	         }else {
	        	 out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.(5회중 " + count + "번 실패'); history.go(-1);</script>");
	         }
	         
	        
	           out_equals.flush();
	           
	           return mv2;
	      }
	      return mv;
	   
	   }
	
	
	
}
*/