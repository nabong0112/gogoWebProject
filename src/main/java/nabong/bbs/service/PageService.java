package nabong.bbs.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nabong.bbs.vo.PageVo;

public interface PageService {
	//String test() throws Exception;

	public String memberInfoService() throws Exception;

	public void fileUpload(PageVo pageVo, Boolean isLocal) throws Exception;

	public List<PageVo> fileList() throws Exception; 

	public boolean loginService(HttpSession session, PageVo vo) throws Exception;

	public PageVo myPageService(HttpSession session, String id) throws Exception;
	
	public List<PageVo> getnoticeService(int boardValue) throws Exception;
	
	public void insertNoticeService(PageVo vo) throws Exception;
	
	public void updateNoticeService(PageVo vo) throws Exception;
	
	public PageVo readNoticeService(int boardNo) throws Exception;

	public void deleteNoticeService(int boardNo) throws Exception;
	
	public void countNoticeService(int boardNo) throws Exception;
	
	public List<PageVo> getTestData(int boardValue) throws Exception;

	public void noticeCountService(int boardNo) throws Exception;
	
	public PageVo fileDownload(PageVo pageVo) throws Exception;
	
	public List<PageVo> getCommentService(int boardNo) throws Exception;

	public void deleteCommentService(int commentNo)throws Exception ;

	public void insertCommentService(PageVo vo) throws Exception;

	public List<PageVo> searchNoticeService(PageVo vo);

	public String joinService(PageVo vo);
	
	public void joinCheckService(PageVo vo);

	public PageVo findUserService(PageVo vo);
	
	public void insertnavermember(PageVo vo) throws Exception;
	
	public int idcheck(String userId) throws Exception;

	public void mailSendWithUserKey(String userEmail,  String userId, String userName, HttpServletRequest request);

	public int alter_userKey(String userId, String userKey);
	
	public String idfind(String userName, String userBirth);
	
	public void mailSendWithPassword(String userId, String userEmail, HttpServletRequest request);
	
	public int logincheck1(PageVo vo, HttpSession session) throws Exception;
	
	public PageVo mypaging(String id);
	
	public int userdelete(String id);
	
	public int editpw(String userPw, String userId);
	
	public int editphone(String userPhone, String userId);
	
	public int editbirth(String userBirth, String userId);
	
	public int editemail(String userEmail, String userId);

	
}
