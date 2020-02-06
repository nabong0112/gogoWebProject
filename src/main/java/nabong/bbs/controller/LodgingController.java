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
import nabong.bbs.vo.TourLodgingDataVo;

@Controller
public class LodgingController {

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
	
	@RequestMapping(value="/lodgingList.do")
	public String lodgingList(Model mv, @RequestParam (defaultValue = "1") int pageNo, TourLodgingDataVo searchVo) throws Exception {
		
		List<TourLodgingDataVo> lodgingList = apiService.tourLodgingListService(pageNo, 6, searchVo);
		
		mv.addAttribute("lodgingList", lodgingList);
		
		return "/api/Lodging/lodgingList";
	}
	
	@RequestMapping(value="/lodgingItem.do")
	public String lodgingItem(Model mv, @RequestParam String lodgingSeq ) throws Exception  {

		TourLodgingDataVo lodgingItem = apiService.tourLodgingItemService(lodgingSeq);
		
		mv.addAttribute("lodgingItem", lodgingItem);
		
		return "/api/Lodging/lodgingItem";
	}
	
	
	
	
}
