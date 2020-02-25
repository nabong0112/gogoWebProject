package nabong.bbs.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import nabong.bbs.service.ApiService;
import nabong.bbs.vo.CommonVo;
import nabong.bbs.vo.TourDataVo;
import nabong.bbs.vo.TourFastivalDataVo;
import nabong.bbs.vo.TourLodgingDataVo;
import nabong.bbs.vo.TourFoodDataVo;

@Service("apiService")
public class ApiServiceImpl extends EgovAbstractServiceImpl implements ApiService{
	
	private static final String SERVICE_KEY = "serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D";
	private static final String URL = "http://apis.data.go.kr/6300000/";

	//축제정보
	private static final String TOUR_FASTIVAL_LIST = "festivalDaejeonService/festivalDaejeonList?";
	private static final String TOUR_FASTIVAL_ITEM = "festivalDaejeonService/festivalDaejeonItem?";
	//관광지 정보
	private static final String TOUR_DATA_LIST = "tourDataService/tourDataList?";
	private static final String TOUR_DATA_ITEM = "tourDataService/tourDataItem?";
	//음식점
	private static final String TOUR_FOOD_DATA_LIST = "tourFoodDataService/tourFoodDataList?";
	private static final String TOUR_FOOD_DATA_ITEM = "tourFoodDataService/tourFoodDataItem?";
	//숙박업소
	private static final String TOUR_LODGING_DATA_LIST = "tourLodgingService/tourLodgingList?";
	private static final String TOUR_LODGING_DATA_ITEM = "tourLodgingService/tourLodgingItem?";
	private static final String TOUR_FOOD_LODGING_ROOM_LIST = "tourLodgingService/tourLodgingRoomList?";
	private static final String LIST_ESSENTIAL_COLUMN = "&numOfRows=6&pageNo=";
	BufferedReader br = null;
	
	CommonVo common = new CommonVo();
	//페이징
	public CommonVo getPageing(String url) throws Exception {
		int countPage = 5; //한 화면에 출력될 페이지 수
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		// dom tree가 xml문서의 구조대로 완성이 됨
		doc.getDocumentElement().normalize();
		Node node = doc.getElementsByTagName("msgHeader").item(0);
		CommonVo vo = new CommonVo();
		if (node.getNodeType() == Node.ELEMENT_NODE) {
			Element element = (Element) node;
			vo.setTotalPage(getTagValue("totalPage", element));

			vo.setPageNo(getTagValue("pageNo", element));

			vo.setNumOfRows(getTagValue("numOfRows", element));

			vo.setTotalCount(getTagValue("totalCount", element));
		}
		vo.setStartPage(vo.getPageNo());
		vo.setEndPage(Integer.toString((Integer.parseInt(vo.getStartPage()) + countPage - 1)));
		if(Integer.parseInt(vo.getStartPage()) < 1) {
			vo.setStartPage(Integer.toString(1));
		}
		if(Integer.parseInt(vo.getTotalPage()) <= Integer.parseInt(vo.getEndPage()) || Integer.parseInt(vo.getTotalPage()) <= Integer.parseInt(vo.getPageNo())) {
			vo.setEndPage(vo.getTotalPage());
		}
		System.out.println("getNumOfRows : " + vo.getNumOfRows().toString());
		System.out.println("getTotalCount : " + vo.getTotalCount().toString());
		System.out.println("getTotalPage : " + vo.getTotalPage().toString());
		System.out.println("getPageNo : " + vo.getPageNo().toString());
		System.out.println("getStartPage : " + vo.getStartPage().toString());
		
		System.out.println("getEndPage : " + vo.getEndPage().toString());
		return vo;
	}
	
	//해당 태그의 값 불러오기
	private static String getTagValue(String tag, Element eElement) {
    	if(eElement.getElementsByTagName(tag).item(0) != null) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    	if(nValue == null) {
	    		return "해당 내용이 존재하지 않습니다.";
	    	} else {
	    		return nValue.getNodeValue();
	    	}
    	}else {
    		return "해당 내용이 존재하지 않습니다.";
    	}
    	
	}

	//대전 문화 축제 목록 조회 화면
	@Override
	public List<TourFastivalDataVo> tourFastivalListService(int pageNo, int numOfRows,TourFastivalDataVo searchVo ) throws Exception{
		List<TourFastivalDataVo> tourFastivalList = new ArrayList<>();
			String url = URL + TOUR_FASTIVAL_LIST + SERVICE_KEY + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo;
			//페이지에 접근해 줄 Document객체 생성
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			// 최상위 태그 불러오기
			// dom tree가 xml문서의 구조대로 완성이 됨
			doc.getDocumentElement().normalize();
			
			// 파싱할 tag = MsgBody 안에 있음
			NodeList nList = doc.getElementsByTagName("items");
			for(int temp = 0; temp < nList.getLength(); temp++){
				TourFastivalDataVo fastivalListVo = new TourFastivalDataVo();
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					fastivalListVo.setNtatcSeq(getTagValue("ntatcSeq", eElement));
					fastivalListVo.setTitle(getTagValue("title", eElement));
					fastivalListVo.setOpenPlace(getTagValue("openPlace", eElement));
					fastivalListVo.setOpnStrtDt(getTagValue("opnStrtDt", eElement));
					fastivalListVo.setOpnEndDt(getTagValue("opnEndDt", eElement));
					fastivalListVo.setContent(getTagValue("content", eElement));
					fastivalListVo.setManageAgency(getTagValue("manageAgency", eElement));
					fastivalListVo.setAuspiceAgency(getTagValue("auspiceAgency", eElement));
					fastivalListVo.setDataStnDt(getTagValue("dataStnDt", eElement));
					fastivalListVo.setTel(getTagValue("tel", eElement));
					fastivalListVo.setHomepageUrl(getTagValue("homepageUrl", eElement));
					fastivalListVo.setTotalCount(getTagValue("totalCount", eElement));
					fastivalListVo.setRegDtTm(getTagValue("regDtTm", eElement));
				}
				
				tourFastivalList.add(fastivalListVo);
			}
		return tourFastivalList;
	}
	//문화 축제 상세 화면
	@Override
	public TourFastivalDataVo tourFastivalItemService(String ntatcSeq) throws Exception{
		String url = URL + TOUR_FASTIVAL_ITEM + SERVICE_KEY + "&ntatcSeq=" + ntatcSeq;
		//페이지에 접근해 줄 Document객체 생성
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		// 최상위 태그 불러오기
		// dom tree가 xml문서의 구조대로 완성이 됨
		doc.getDocumentElement().normalize();
		
		// 파싱할 tag = MsgBody 안에 있음
		NodeList nList = doc.getElementsByTagName("msgBody");
		Node nNode = nList.item(0);
		TourFastivalDataVo fastivalItemVo = new TourFastivalDataVo();
		if(nNode.getNodeType() == Node.ELEMENT_NODE){
			Element eElement = (Element) nNode;
			fastivalItemVo.setNtatcSeq(getTagValue("ntatcSeq", eElement));
			fastivalItemVo.setTitle(getTagValue("title", eElement));
			fastivalItemVo.setOpenPlace(getTagValue("openPlace", eElement));
			fastivalItemVo.setOpnStrtDt(getTagValue("opnStrtDt", eElement));
			fastivalItemVo.setOpnEndDt(getTagValue("opnEndDt", eElement));
			fastivalItemVo.setContent(getTagValue("content", eElement));
			fastivalItemVo.setManageAgency(getTagValue("manageAgency", eElement));
			fastivalItemVo.setAuspiceAgency(getTagValue("auspiceAgency", eElement));
			fastivalItemVo.setDataStnDt(getTagValue("dataStnDt", eElement));
			fastivalItemVo.setTel(getTagValue("tel", eElement));
			fastivalItemVo.setHomepageUrl(getTagValue("homepageUrl", eElement));
		}	// if end
		return fastivalItemVo;
	}
	
	//대전 관광지 상세조회, 목록 조회
	/*TODO*/
	@Override
	public List<TourDataVo> tourListService(int pageNo, int numOfRows, TourDataVo searchVo) throws Exception{
		List<TourDataVo> tourDataList = new ArrayList<>();
			String url = URL + TOUR_DATA_LIST + SERVICE_KEY + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo;
				//페이지에 접근해 줄 Document객체 생성
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// 최상위 태그 불러오기
				// dom tree가 xml문서의 구조대로 완성이 됨
				doc.getDocumentElement().normalize();
				
				// 파싱할 tag = MsgBody 안에 있음
				NodeList nList = doc.getElementsByTagName("items");
				for(int temp = 0; temp < nList.getLength(); temp++){
					TourDataVo tourListVo = new TourDataVo();
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						tourListVo.setTourSeq(getTagValue("tourSeq", eElement));
						tourListVo.setId(getTagValue("id", eElement));
						tourListVo.settGubun(getTagValue("dCode", eElement)); //관광지 코드
						tourListVo.setName(getTagValue("name", eElement));
						tourListVo.setdCode(getTagValue("dCode", eElement)); //관광 자원 코드 
						tourListVo.setpGubun(getTagValue("pGubun", eElement));
						tourListVo.setlGubun(getTagValue("lGubun", eElement));
						tourListVo.setAddr1(getTagValue("addr1", eElement));
						tourListVo.setAddr2(getTagValue("addr2", eElement));
						tourListVo.setTelCode(getTagValue("telCode", eElement));
						tourListVo.setTelKuk(getTagValue("telKuk", eElement));
						tourListVo.setTelNo(getTagValue("telNo", eElement));
						tourListVo.setContents2(getTagValue("contents2", eElement));
					}	// if end
				tourDataList.add(tourListVo);
				}	// for end
				
				System.out.println("page number : "+pageNo);
		return tourDataList;
	}
	
	@Override
	public TourDataVo tourItemService(String tourSeq) throws Exception{
		TourDataVo tourListVo = new TourDataVo();
		//http://apis.data.go.kr/6300000/tourDataService/tourDataItem?serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D&tourSeq=1321
		String url = URL + TOUR_DATA_ITEM + SERVICE_KEY + "&tourSeq=" + tourSeq;
			//페이지에 접근해 줄 Document객체 생성
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			// 최상위 태그 불러오기
			// dom tree가 xml문서의 구조대로 완성이 됨
			doc.getDocumentElement().normalize();
			
			// 파싱할 tag = msgBody 안에 있음
			NodeList nList = doc.getElementsByTagName("msgBody");
			Node nNode = nList.item(0);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				Element eElement = (Element) nNode;
				tourListVo.setTourSeq(getTagValue("tourSeq", eElement));
				tourListVo.setId(getTagValue("id", eElement));
				tourListVo.settGubun(getTagValue("tGubun", eElement)); //관광지 코드
				tourListVo.setName(getTagValue("name", eElement));
				tourListVo.setdCode(getTagValue("dCode", eElement)); //관광 자원 코드 
				tourListVo.setpGubun(getTagValue("pGubun", eElement));
				tourListVo.setlGubun(getTagValue("lGubun", eElement));
				tourListVo.setAddr1(getTagValue("addr1", eElement));
				tourListVo.setAddr2(getTagValue("addr2", eElement));
				tourListVo.setTelCode(getTagValue("telCode", eElement));
				tourListVo.setTelKuk(getTagValue("telKuk", eElement));
				tourListVo.setTelNo(getTagValue("telNo", eElement));
				tourListVo.setContents1(getTagValue("contents1", eElement));
			}
		return tourListVo;
	}	
	
	//대전 음식점 목록 조회
	/*TODO*/
	@Override
	public List<TourFoodDataVo> tourFoodListService(int pageNo, int numOfRows,TourFoodDataVo searchVo) throws Exception{
		String url;
		List<TourFoodDataVo> tourFoodDataList = new ArrayList<>();
		if(searchVo.getdGu() != null && searchVo.getSearchKeyword() != null || searchVo.getSearchCondition() != null || searchVo.getdCode() != null) {
			
			// parsing할 url지정
			url = URL + TOUR_FOOD_DATA_LIST + SERVICE_KEY + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo + "&dGu=" + searchVo.getdGu() + "&searchKeyword=" + searchVo.getSearchKeyword();
		} else {
			// parsing할 url지정
			url = URL + TOUR_FOOD_DATA_LIST + SERVICE_KEY + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo;
		}
				//페이지에 접근해 줄 Document객체 생성
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// dom tree가 xml문서의 구조대로 완성이 됨
				doc.getDocumentElement().normalize();
				NodeList nList = doc.getElementsByTagName("items");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				for(int temp = 0; temp < nList.getLength(); temp++){
					TourFoodDataVo foodListVo = new TourFoodDataVo();
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						foodListVo.setFoodSeq(getTagValue("foodSeq", eElement));
						foodListVo.setdCodeNm(getTagValue("dCodeNm", eElement));
						foodListVo.setdGuNm(getTagValue("dGuNm", eElement));
						foodListVo.setName(getTagValue("name", eElement));
						foodListVo.setdCode(getTagValue("dCode", eElement));
						foodListVo.setdGu(getTagValue("dGu", eElement));
						foodListVo.setTopMenu(getTagValue("topMenu", eElement));
						foodListVo.setTelCode(getTagValue("telCode", eElement));
						foodListVo.setTelKuk(getTagValue("telKuk", eElement));
						foodListVo.setTelNo(getTagValue("telNo", eElement));
						foodListVo.setContents1(getTagValue("contents1", eElement));
					} //if 끝	
				tourFoodDataList.add(foodListVo);
				}// for문 끝
		return tourFoodDataList;
		
	}
	//대전 음식점 상세조회
	@Override
	public TourFoodDataVo tourFoodItemService(String foodSeq) throws Exception{
		// parsing할 url지정
		String url = URL + TOUR_FOOD_DATA_ITEM + SERVICE_KEY + "&foodSeq=" + foodSeq ;
		System.out.println(url);
		
		//페이지에 접근해 줄 Document객체 생성
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		doc.getDocumentElement().normalize();
		
		TourFoodDataVo foodItemVo = new TourFoodDataVo();
		// 파싱할 tag = msgBody 안에 있음
		NodeList nList = doc.getElementsByTagName("msgBody");
		Node nNode = nList.item(0);
		if(nNode.getNodeType() == Node.ELEMENT_NODE){
			Element eElement = (Element) nNode;
			foodItemVo.setFoodSeq(getTagValue("foodSeq", eElement));
			foodItemVo.setName(getTagValue("name", eElement));
			foodItemVo.setAddr1(getTagValue("addr1", eElement));
			foodItemVo.setAddr2(getTagValue("addr2", eElement));
			foodItemVo.setOpenTime(getTagValue("openTime", eElement));
			foodItemVo.setCloseTime(getTagValue("closeTime", eElement));
			foodItemVo.setTelCode(getTagValue("telCode", eElement));
			foodItemVo.setTelKuk(getTagValue("telKuk", eElement));
			foodItemVo.setTelNo(getTagValue("telNo", eElement));
			foodItemVo.setContents1(getTagValue("contents1", eElement));
			foodItemVo.setTitle(getTagValue("title", eElement));
			foodItemVo.setIntro(getTagValue("intro", eElement));
			foodItemVo.setPrice(getTagValue("price", eElement));
			foodItemVo.setOwnerDriver(getTagValue("ownerDriver", eElement));
			foodItemVo.setPublicTraffic1(getTagValue("publicTraffic1",eElement));
			foodItemVo.setPublicTraffic2(getTagValue("publicTraffic2",eElement));
		}	// if end
		System.out.println(foodItemVo.getAddr1());
		return foodItemVo;
		
	}
	
	//대전 숙박업소 상세조회, 목록조회
	@Override
	public List<TourLodgingDataVo> tourLodgingListService(int pageNo, int numOfRows, TourLodgingDataVo searchVo) throws Exception{
		List<TourLodgingDataVo> tourLogingDataList = new ArrayList<>();
			String url = URL + TOUR_LODGING_DATA_LIST + SERVICE_KEY + "&numOfRows=" + numOfRows + "&pageNo=" + pageNo;
				//페이지에 접근해 줄 Document객체 생성
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				// 최상위 태그 불러오기
				doc.getDocumentElement().normalize();
				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				
				// 파싱할 tag = MsgBody 안에 있음
				NodeList nList = doc.getElementsByTagName("items");
				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				for(int temp = 0; temp < nList.getLength(); temp++){
					TourLodgingDataVo lodgingListVo = new TourLodgingDataVo();
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						lodgingListVo.setLodgingSeq(getTagValue("lodgingSeq", eElement));
						lodgingListVo.setDcodeNm(getTagValue("dcodeNm", eElement));
						lodgingListVo.setDguNm(getTagValue("dguNm", eElement));
						lodgingListVo.setName(getTagValue("name", eElement));
						lodgingListVo.setDcode(getTagValue("dcode", eElement));
						lodgingListVo.setDgu(getTagValue("dgu", eElement));
						lodgingListVo.setAddr1(getTagValue("addr1", eElement));
						lodgingListVo.setTelCode(getTagValue("telCode", eElement));
						lodgingListVo.setTelKuk(getTagValue("telKuk", eElement));
						lodgingListVo.setTelNo(getTagValue("telNo", eElement));
						lodgingListVo.setContents1(getTagValue("contents1", eElement));
					}	// if end
					tourLogingDataList.add(lodgingListVo);
				}	// for end
				
				System.out.println("page number : "+pageNo);
		return tourLogingDataList; 
	}
	
	@Override
	public TourLodgingDataVo tourLodgingItemService(String lodgingSeq) throws Exception{
		String url = URL + TOUR_LODGING_DATA_ITEM + SERVICE_KEY + "&lodgingSeq=" + lodgingSeq;
		//페이지에 접근해 줄 Document객체 생성
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
				
			doc.getDocumentElement().normalize();
				
			TourLodgingDataVo lodgingItemVo = new TourLodgingDataVo();
				// 파싱할 tag = MsgBody 안에 있음
			NodeList nList = doc.getElementsByTagName("msgBody");
			Node nNode = nList.item(0);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				Element eElement = (Element) nNode;
				lodgingItemVo.setLodgingSeq(getTagValue("lodgingSeq", eElement));
				lodgingItemVo.setName(getTagValue("name", eElement));
				lodgingItemVo.setAddr1(getTagValue("addr1", eElement));
				lodgingItemVo.setAddr2(getTagValue("addr2", eElement));
				lodgingItemVo.setOpenTime(getTagValue("openTime", eElement));
				lodgingItemVo.setCloseTime(getTagValue("closeTime", eElement));
				lodgingItemVo.setTelCode(getTagValue("telCode", eElement));
				lodgingItemVo.setTelKuk(getTagValue("telKuk", eElement));
				lodgingItemVo.setTelNo(getTagValue("telNo", eElement));
				lodgingItemVo.setContents1(getTagValue("contents1", eElement));
			}	// if end
				return lodgingItemVo;
	}
	
}
