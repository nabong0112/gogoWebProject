package nabong.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.CommonVo;
import nabong.bbs.vo.TourDataVo;

@Controller
public class TourController {
	
	private static final String URL = "http://apis.data.go.kr/6300000/";
	private static final String TOUR_DATA_LIST = "tourDataService/tourDataList?";
	private static final String TOUR_DATA_ITEM = "tourDataService/tourDataItem?";
	private static final String SERVICE_KEY = "serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D";
	
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping(value="/Tour/tourList.do")
	public String tourList(@RequestParam(defaultValue = "1") int pageNo, Model mv, TourDataVo searchVo) throws Exception{
		String url = URL + TOUR_DATA_LIST + SERVICE_KEY + "&numOfRows=" + 6 + "&pageNo=" + pageNo;
		if(pageNo < 1) {
			pageNo = 1;
		}
		CommonVo paging = apiService.getPageing(url);
		List<TourDataVo> tourList = apiService.tourListService(pageNo, 6, searchVo);
		
		mv.addAttribute("tourList", tourList);
		mv.addAttribute("paging", paging);
		return "/api/Tour/tourList";
	}

	@RequestMapping(value="/Tour/tourItem.do")
	public String tourItem(@RequestParam String tourSeq, Model mv) throws Exception{
		
		TourDataVo tourItem = apiService.tourItemService(tourSeq);
		
		mv.addAttribute("tourItem",tourItem);
		
		return "/api/Tour/tourItem";
	}
	
	@RequestMapping(value="/Tour/searchTourList.do")
	public String searchTourList(@RequestParam String tourSeq, Model mv) throws Exception{
		
		TourDataVo tourItem = apiService.tourItemService(tourSeq);
		
		mv.addAttribute("tourItem",tourItem);
		
		return "/api/Tour/tourItem";
	}

}
