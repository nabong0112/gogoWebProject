package nabong.bbs.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import nabong.bbs.service.NaverLoginBO;
import nabong.bbs.service.PageService;
import nabong.bbs.vo.PageVo;


@Controller
public class LoginController {
	
	@Autowired
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	private PageService pageService;
	
	private String apiResult = null;

	@RequestMapping(value= "loginform.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("���̹�:"+naverAuthUrl);
		
		model.addAttribute("url", naverAuthUrl);
		
		return "/api/loginform";
	}
	
	@RequestMapping(value= "navercallback.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request, PageVo vo) throws Exception{
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);
		
		JSONParser parser = new JSONParser();
		Object obj=parser.parse(apiResult);
		parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		JSONObject response=(JSONObject)jsonObj.get("response");
		String navername=(String)response.get("name");
		vo.setNavername((String)response.get("name"));
		vo.setNaveremail((String)response.get("email"));
		vo.setNavernickname((String)response.get("nickname"));
		pageService.insertnavermember(vo);
		
		session.setAttribute("userId", navername);
		model.addAttribute("result",apiResult);
		System.out.println(vo.getNavername());
		
		return "main";
	}
	
	@RequestMapping(value="/naverloginout.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String naverlogout(HttpSession session) throws IOException {
		session.invalidate();
		return "redirect:main.do";
		 
	}
	
}
