package nabong.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.TourDataVo;

@Controller
public class TourController {
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping(value="/Tour/tourList.do")
	public String tourList(@RequestParam(defaultValue = "1") int pageNo, Model mv, TourDataVo searchVo) throws Exception{
		
		List<TourDataVo> tourList = apiService.tourListService(pageNo, 6, searchVo);
		
		mv.addAttribute("tourList", tourList);
		
		return "/api/Tour/tourList";
	}
	
	/*TODO
	 * api 안됨
	 * */
	@RequestMapping(value="/Tour/tourItem.do")
	public String tourItem(@RequestParam String tourSeq, Model mv) throws Exception{
		
		TourDataVo tourItem = apiService.tourItemService(tourSeq);
		
		mv.addAttribute("tourItem",tourItem);
		
		return "/api/Tour/tourItem";
	}
	
	@RequestMapping(value="/Tour//searchTourList.do")
	public String searchTourList(@RequestParam String tourSeq, Model mv) throws Exception{
		
		TourDataVo tourItem = apiService.tourItemService(tourSeq);
		
		mv.addAttribute("tourItem",tourItem);
		
		return "/api/Tour/tourItem";
	}

}
