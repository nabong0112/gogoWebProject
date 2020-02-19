package nabong.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.CommonVo;
import nabong.bbs.vo.TourFastivalDataVo;

@Controller
public class FastivalController {
	
	private static final String URL = "http://apis.data.go.kr/6300000/";
	private static final String TOUR_FASTIVAL_LIST = "festivalDaejeonService/festivalDaejeonList?";
	private static final String TOUR_FASTIVAL_ITEM = "festivalDaejeonService/festivalDaejeonItem?";
	private static final String SERVICE_KEY = "serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D";
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping(value="/daejeonHistory.do")
	public String daejeonHistory(Model mv) throws Exception {
		
		return "/api/Fastival/daejeonHistory";
	}
	
	@RequestMapping(value="/fastivalList.do")
	public String fastivalList(Model mv, @RequestParam (defaultValue = "1") int pageNo, TourFastivalDataVo searchVo) throws Exception{
		String url = URL + TOUR_FASTIVAL_LIST + SERVICE_KEY + "&numOfRows=" + 6 + "&pageNo=" + pageNo;
		if(pageNo < 1) {
			pageNo = 1;
		}
		CommonVo paging = apiService.getPageing(url);
		List<TourFastivalDataVo> fastivalList = apiService.tourFastivalListService(pageNo, 6, searchVo);
		
		mv.addAttribute("fastivalList", fastivalList);
		mv.addAttribute("paging", paging);
		return "/api/Fastival/fastivalList";
	}
	
	@RequestMapping(value="/fastivalItem.do")
	public String fastivalItem(Model mv, @RequestParam String ntatcSeq) throws Exception {
		
		TourFastivalDataVo fastivalItem = apiService.tourFastivalItemService(ntatcSeq);
		
		mv.addAttribute("fastivalItem", fastivalItem);
		
		return "/api/Fastival/fastivalItem";
	}

}
