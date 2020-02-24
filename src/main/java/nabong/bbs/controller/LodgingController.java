package nabong.bbs.controller;

import org.springframework.stereotype.Controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.CommonVo;
import nabong.bbs.vo.TourLodgingDataVo;

@Controller
public class LodgingController {
	
	private static final String URL = "http://apis.data.go.kr/6300000/";
	private static final String TOUR_LODGING_DATA_LIST = "tourLodgingService/tourLodgingList?";
	private static final String TOUR_LODGING_DATA_ITEM = "tourLodgingService/tourLodgingItem?";
	private static final String SERVICE_KEY = "serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D";
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping(value="/touristHotelList.do")
	public String touristHotelList(Model mv) throws Exception  {
		
		return "/api/Lodging/touristHotelList";
	}
	
	@RequestMapping(value="/touristHotelItem.do")
	public String touristHotelItem(Model mv) throws Exception  {
		
		return "/api/Lodging/touristHotelItem";
	}
	
	@RequestMapping(value="Tour/lodgingList.do")
	public String lodgingList(Model mv, @RequestParam (defaultValue = "1") int pageNo, TourLodgingDataVo searchVo) throws Exception {
		
		String url = URL + TOUR_LODGING_DATA_LIST + SERVICE_KEY + "&numOfRows=" + 6 + "&pageNo=" + pageNo;
		if(pageNo < 1) {
			pageNo = 1;
		}
		CommonVo paging = apiService.getPageing(url);
		
		List<TourLodgingDataVo> lodgingList = apiService.tourLodgingListService(pageNo, 6, searchVo);
		
		mv.addAttribute("lodgingList", lodgingList);
		mv.addAttribute("paging",paging);
		
		return "/api/Lodging/lodgingList";
	}
	
	@RequestMapping(value="Tour/lodgingItem.do")
	public String lodgingItem(Model mv, @RequestParam String lodgingSeq ) throws Exception  {

		TourLodgingDataVo lodgingItem = apiService.tourLodgingItemService(lodgingSeq);
		
		mv.addAttribute("lodgingItem", lodgingItem);
		
		return "/api/Lodging/lodgingItem";
	}
	
	
	
	
}
