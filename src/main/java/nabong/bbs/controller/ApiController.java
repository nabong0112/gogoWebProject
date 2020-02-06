package nabong.bbs.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import nabong.bbs.service.ApiService;

@Controller
public class ApiController {
	
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}
	@RequestMapping("/tourHompageHeader.do")
	public String header(Model mv) throws Exception {
		return "/include/tourHompageHeader";
	}
	
	// 받아오기
		@RequestMapping("/apiTest.do")
		public String apiTest(Model mv) throws Exception {
			BufferedReader br = null;
			int pageNo = 1;
	        try{
	            String urlstr = "http://apis.data.go.kr/"
	                    + "6300000/tourFoodDataService/tourFoodDataList?"
	                    + "serviceKey=%2B04YS1ydsBqlx3NmRFUsC1sRHrt4m%2BvzBhW9nes16%2FLC5oXQmE38nKIeuYvcy4NKiuv2RyH9FrirU4ZK7APzHg%3D%3D"
	                    + "&numOfRows=10&pageNo=" + pageNo;
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            String result = "";
	            String line;
	            while((line = br.readLine()) != null) {
	                result = result + line + "\n";
	            }
	            mv.addAttribute("test", result);
	            System.out.println(result);
	        }catch(Exception e){
	            System.out.println(e.getMessage());
	        } 
			return "/api/apiTest";

		}
		
		@RequestMapping("/BestTourList.do")
		public String bestTourList(Model mv) throws Exception{
			
			return "/api/bestTourList";
		}
		
		@RequestMapping("/BestTourItem.do")
		public String bestTourItem(Model mv) throws Exception{
			
			return "/api/bestTourItem";
		}
		
		
	
	
}
