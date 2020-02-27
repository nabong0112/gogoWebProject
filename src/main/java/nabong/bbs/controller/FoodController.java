package nabong.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.CommonVo;
import nabong.bbs.vo.TourFoodDataVo;

@Controller
public class FoodController {
	
	private static final String SERVICE_KEY = "serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D";
	private static final String URL = "http://apis.data.go.kr/6300000/";
	private static final String TOUR_FOOD_DATA_LIST = "tourFoodDataService/tourFoodDataList?";
	private static final String TOUR_FOOD_DATA_ITEM = "tourFoodDataService/tourFoodDataItem?";
	String menu = "food";
	@Autowired
	private ApiService apiService;
	
	@RequestMapping("/Tour/bestFoodList.do")
	public String bestFoodList(Model mv) throws Exception{
		
		
		
		return "/api/Food/bestFoodList";
	}
	
	@RequestMapping("/Tour/featuredFoodList.do")
	public String featuredFoodList(Model mv) throws Exception{
		
		
		
		return "/api/Food/featuredFoodList";
	}

	@RequestMapping(value="/Tour/foodList.do")
	public String foodList(@RequestParam(defaultValue = "1") int pageNo,TourFoodDataVo searchVo, Model mv) throws Exception{
		String url = URL + TOUR_FOOD_DATA_LIST + SERVICE_KEY + "&numOfRows=" + 6 + "&pageNo=" + pageNo;
		if(pageNo < 1) {
			pageNo = 1;
		}
		CommonVo paging = apiService.getPageing(url);

		if(pageNo > Integer.parseInt(paging.getTotalPage())) {
			pageNo = Integer.parseInt(paging.getEndPage());
		}
		List<TourFoodDataVo> foodList = apiService.tourFoodListService(pageNo, 6,searchVo);
		
		mv.addAttribute("foodList", foodList);
		if(searchVo.getdGu() != null || searchVo.getSearchKeyword() != null || searchVo.getSearchCondition() != null || searchVo.getdCode() != null) {
			mv.addAttribute("searchVo", searchVo);
		}
		mv.addAttribute("paging", paging);
		mv.addAttribute("menu", menu);
		return "/api/Food/foodList";
	}
	
	@RequestMapping("Tour/foodItem.do")
	public String foodItem(@RequestParam String foodSeq, Model mv) throws Exception{
		
		mv.addAttribute("foodItem", apiService.tourFoodItemService(foodSeq));
		mv.addAttribute("menu", menu);
		
		return "/api/Food/foodItem";
	}
}
