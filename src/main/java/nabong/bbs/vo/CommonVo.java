package nabong.bbs.vo;

public class CommonVo {
	
	private String searchKeyword;
	
	private String searchCondition;
	
	private String totalPage;
	
	public String getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(String totalPage) {
		this.totalPage = totalPage;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getNumOfRows() {
		return numOfRows;
	}

	public void setNumOfRows(String numOfRows) {
		this.numOfRows = numOfRows;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	private String pageNo;
	
	private String numOfRows;
	
	private String totalCount;
	
	private String returnCode;
	
	private String returnMessage;
	
	private String successYN;
	
	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}

	public String getReturnMessage() {
		return returnMessage;
	}

	public void setReturnMessage(String returnMessage) {
		this.returnMessage = returnMessage;
	}

	public String getSuccessYN() {
		return successYN;
	}

	public void setSuccessYN(String successYN) {
		this.successYN = successYN;
	}

}
