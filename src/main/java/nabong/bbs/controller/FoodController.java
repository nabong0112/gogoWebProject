package nabong.bbs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nabong.bbs.service.ApiService;
import nabong.bbs.vo.TourFoodDataVo;

@Controller
public class FoodController {
	
	@Autowired
	private ApiService apiService;
	
	@RequestMapping("/bestFoodList.do")
	public String bestFoodList(Model mv) throws Exception{
		
		
		
		return "/api/Food/bestFoodList";
	}
	
	@RequestMapping("/featuredFoodList.do")
	public String featuredFoodList(Model mv) throws Exception{
		
		
		
		return "/api/Food/featuredFoodList";
	}

	@RequestMapping(value="/foodList.do")
	public String foodList(@RequestParam(defaultValue = "1") int pageNo,TourFoodDataVo searchVo, Model mv) throws Exception{
		
		List<TourFoodDataVo> foodList = apiService.tourFoodListService(pageNo, 6,searchVo);
		
		mv.addAttribute("foodList", foodList);
		if(searchVo.getdGu() != null || searchVo.getSearchKeyword() != null || searchVo.getSearchCondition() != null || searchVo.getdCode() != null) {
			mv.addAttribute("searchVo", searchVo);
		}
		mv.addAttribute("totalPage",foodList.get(0).getTotalPage());
		mv.addAttribute("pageNo", pageNo);
		return "/api/Food/foodList";
	}
	
	@RequestMapping("/foodItem.do")
	public String foodItem(@RequestParam String foodSeq, Model mv) throws Exception{
		
		mv.addAttribute("foodItem", apiService.tourFoodItemService(foodSeq));
		
		return "/api/Food/foodItem";
	}
}
