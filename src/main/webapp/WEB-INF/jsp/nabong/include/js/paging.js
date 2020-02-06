/**
 * 도로명주소 페이징
 */
//페이지 이동
function goPage(pageNum){
	document.form.currentPage.value=pageNum;
	getAddr();
}
// json타입 페이지 처리 (주소정보 리스트 makeListJson(jsonStr); 다음에서 호출)
/* 
*  json타입으로 페이지 처리시 수정 
*  function pageMake(jsonStr){ 
*  	var total = jsonStr.results.common.totalCount; // 총건수 
*/

// xml타입 페이지 처리 (주소정보 리스트 makeList(xmlData); 다음에서 호출) 
function pageMake(xmlStr){
	var total = $(xmlStr).find("totalCount").text(); // 총건수
	var pageNum = document.form.currentPage.value;// 현재페이지
	var paggingStr = "";
	if(total < 1){
	}else{
		var PAGEBLOCK=document.form.countPerPage.value;
		var pageSize=document.form.countPerPage.value;
		var totalPages = Math.floor((total-1)/pageSize) + 1;
		var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;		
		if( firstPage <= 0 ) firstPage = 1;		
		var lastPage = firstPage-1 + PAGEBLOCK;
		if( lastPage > totalPages ) lastPage = totalPages;		
		var nextPage = lastPage+1 ;
		var prePage = firstPage-5 ;		
		if( firstPage > PAGEBLOCK ){
			paggingStr +=  "<a href='javascript:goPage("+prePage+");'>◁</a>  " ;
		}		
		for( i=firstPage; i<=lastPage; i++ ){
			if( pageNum == i )
				paggingStr += "<a style='font-weight:bold;color:blue;font-size:15px;' href='javascript:goPage("+i+");'>" + i + "</a>  ";
			else
				paggingStr += "<a href='javascript:goPage("+i+");'>" + i + "</a>  ";
		}		
		if( lastPage < totalPages ){
			paggingStr +=  "<a href='javascript:goPage("+nextPage+");'>▷</a>";
		}		
		$("#pageApi").html(paggingStr);
	}	
}