package nabong.bbs.vo;

import java.util.List;

public class TourFoodDataVo extends CommonVo{
	/**
	 * 음식점 목록 
	 */
	private List<TourFoodDataVo> foodList;
	//일련번호
	private String foodSeq;
	//분류코드이름
	private String dCodeNm;
	
	private String dGuNm;
	
	private String name;
	
	private String dCode;
	
	private String dGu;
	
	private String topMenu;
	
	private String telCode;
	
	private String telKuk;
	
	private String telNo;
	
	private String contents1;
	/**
	 * 음식점 상세
	 */
	private String addr1;
	
	private String addr2;
	
	private String openTime;
	
	private String closeTime;
	
	private String title;
	
	private String intro;
	
	private String price;

	public String getFoodSeq() {
		return foodSeq;
	}

	public void setFoodSeq(String foodSeq) {
		this.foodSeq = foodSeq;
	}

	public String getdCodeNm() {
		return dCodeNm;
	}

	public void setdCodeNm(String dCodeNm) {
		this.dCodeNm = dCodeNm;
	}

	public String getdGuNm() {
		return dGuNm;
	}

	public void setdGuNm(String dGuNm) {
		this.dGuNm = dGuNm;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getdCode() {
		return dCode;
	}

	public void setdCode(String dCode) {
		this.dCode = dCode;
	}

	public String getdGu() {
		return dGu;
	}

	public void setdGu(String dGu) {
		this.dGu = dGu;
	}

	public String getTopMenu() {
		return topMenu;
	}

	public void setTopMenu(String topMenu) {
		this.topMenu = topMenu;
	}

	public String getTelCode() {
		return telCode;
	}

	public void setTelCode(String telCode) {
		this.telCode = telCode;
	}

	public String getTelKuk() {
		return telKuk;
	}

	public void setTelKuk(String telKuk) {
		this.telKuk = telKuk;
	}

	public String getTelNo() {
		return telNo;
	}

	public void setTelNo(String telNo) {
		this.telNo = telNo;
	}

	public String getContents1() {
		return contents1;
	}

	public void setContents1(String contents1) {
		this.contents1 = contents1;
	}

	public List<TourFoodDataVo> getFoodList() {
		return foodList;
	}

	public void setFoodList(List<TourFoodDataVo> foodList) {
		this.foodList = foodList;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getOpenTime() {
		return openTime;
	}

	public void setOpenTime(String openTime) {
		this.openTime = openTime;
	}

	public String getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(String closeTime) {
		this.closeTime = closeTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
}