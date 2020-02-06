package nabong.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.TourFastivalDataVo;

@Controller
public class FastivalController {
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping(value="/daejeonHistory.do")
	public String daejeonHistory(Model mv) throws Exception {
		
		return "/api/Fastival/daejeonHistory";
	}
	
	@RequestMapping(value="/fastivalList.do")
	public String fastivalList(Model mv, @RequestParam (defaultValue = "1") int pageNo, TourFastivalDataVo searchVo) throws Exception{
		
		List<TourFastivalDataVo> fastivalList = apiService.tourFastivalListService(pageNo, 6, searchVo);
		
		mv.addAttribute("fastivalList", fastivalList);
		
		return "/api/Fastival/fastivalList";
	}
	
	@RequestMapping(value="/fastivalItem.do")
	public String fastivalItem(Model mv, @RequestParam String ntatcSeq) throws Exception {
		
		TourFastivalDataVo fastivalItem = apiService.tourFastivalItemService(ntatcSeq);
		
		mv.addAttribute("fastivalItem", fastivalItem);
		
		return "/api/Fastival/fastivalItem";
	}

}
