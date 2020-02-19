package nabong.bbs.service;

import java.util.List;

import org.w3c.dom.NodeList;

import nabong.bbs.vo.CommonVo;
import nabong.bbs.vo.TourDataVo;
import nabong.bbs.vo.TourFastivalDataVo;
import nabong.bbs.vo.TourFoodDataVo;
import nabong.bbs.vo.TourLodgingDataVo;

public interface ApiService {
	
	public CommonVo getPageing(String url) throws Exception;
	
	//대전 문화 축제 상세화면, 문화 축제 목록 조회
	/*TODO*/
	public List<TourFastivalDataVo> tourFastivalListService(int pageNo, int numOfRows, TourFastivalDataVo searchVo) throws Exception;
	
	public TourFastivalDataVo tourFastivalItemService(String ntatcSeq) throws Exception;
	
	//대전 관광지 상세조회, 목록 조회
	public List<TourDataVo> tourListService(int pageNo, int numOfRows,TourDataVo searchVo) throws Exception;
	
	public TourDataVo tourItemService(String tourSeq) throws Exception;
	
	//대전 음식점 상세 조회, 목록 조회
	/*TODO*/
	public List<TourFoodDataVo> tourFoodListService(int pageNo, int numOfRows, TourFoodDataVo searchVo) throws Exception;
	
	public TourFoodDataVo tourFoodItemService(String foodSeq) throws Exception;
	
	//대전 숙박업소 상세조회, 목록조회
	public List<TourLodgingDataVo> tourLodgingListService(int pageNo, int numOfRows, TourLodgingDataVo searchVo) throws Exception; 
	
	public TourLodgingDataVo tourLodgingItemService(String lodgingSeq) throws Exception;
}
