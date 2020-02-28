package nabong.bbs.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import nabong.bbs.mapper.PageMapper;
import nabong.bbs.service.PageService;
import nabong.bbs.vo.PageVo;
import nabong.bbs.vo.commonFileVo;

@Service("pageService")
public class PageServiceImpl extends EgovAbstractServiceImpl implements PageService {

	@Resource(name = "pageMapper")
	private PageMapper pageMapper;

	@Override
	public String joinService(PageVo vo) {
		
		//아이디 중복체크
		if(pageMapper.joinIdCheck(vo) != null) {
			return "overlepId";
		}else {
			pageMapper.join(vo);
			return "joinOk";
		}
		
	}

	@Override
	public PageVo findUserService(PageVo vo) {
		
		return pageMapper.findUser(vo);
		
	}
	
	
	/* 공지사항 */
	@Override
	public List<PageVo> getnoticeService(int boardValue) throws Exception {

		List<PageVo> data = pageMapper.getList(boardValue);

		return data;
	}
	@Override
	public List<PageVo> searchNoticeService(PageVo vo){
		System.out.println(vo.getSearchName());
		return pageMapper.search(vo);
		
	}

	// c
	@Override
	public void insertNoticeService(PageVo vo) throws Exception {
		String filePath = "locaition"; //이거 초기화 해줘야지 됨
		UUID uuid = UUID.randomUUID(); // 랜덤한 이름
		filePath = "C:\\egovframework\\upload/";

		MultipartFile file = vo.getMpfile();
		String orgFileNm = file.getOriginalFilename(); //원래 파일이름
//		String fileExt = orgFileNm.substring(orgFileNm.lastIndexOf('.') + 1);
//		String fileName = orgFileNm.substring(0, orgFileNm.lastIndexOf('.'));

		//String fullFileName = fileName + "_" + new SimpleDateFormat("yyyyMMddhhmm").format(new Date()) + "." + fileExt;

		//System.out.println(fullFileName);
		String fullFileName = uuid.toString() + "_" + orgFileNm; // 최종 파일 이름은 랜덤한 이름 + 원래 파일이름 으로 저장
		
//		vo.setFileName(orgFileNm);
//		vo.setFileChangeName(fullFileName);
//		vo.setFilePath((filePath + vo.getFileChangeName()));
		
		try {
			file.transferTo(new File(filePath + File.separator + fullFileName));
			vo.setFileName(orgFileNm);
			vo.setFileChangeName(fullFileName);
			vo.setFilePath(("C:\\\\egovframework\\\\upload/" + vo.getFileChangeName()));
			pageMapper.noticeUpload(vo);

		} catch (Exception e) {

			e.printStackTrace();
		}
			
	}

	// u
	@Override
	public void updateNoticeService(PageVo vo) throws Exception {
		String filePath = "locaition"; //이거 초기화 해줘야지 됨

		filePath = "C:\\egovframework\\upload";

		MultipartFile file = vo.getMpfile();
		String orgFileNm = file.getOriginalFilename();
		String fileExt = orgFileNm.substring(orgFileNm.lastIndexOf('.') + 1);
		String fileName = orgFileNm.substring(0, orgFileNm.lastIndexOf('.'));

		String fullFileName = fileName + "_" + new SimpleDateFormat("yyyyMMddhhmm").format(new Date()) + "." + fileExt;

		System.out.println(fullFileName);
		
		try {
			file.transferTo(new File(filePath + File.separator + fullFileName));
			vo.setFileName(fullFileName);
			pageMapper.noticeUpdate(vo);

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	// r
	@Override
	public PageVo readNoticeService(int boardNo) throws Exception {
		
		return pageMapper.noticeRead(boardNo);

	}
	//조회수
	@Override
	public void noticeCountService(int boardNo) throws Exception {
		
		pageMapper.noticeCount(boardNo);

	}

	// d
	@Override
	public void deleteNoticeService(int boardNo) throws Exception {

		pageMapper.noticeDelete(boardNo);

	}

	// 조회수
	@Override
	public void countNoticeService(int boardNo) throws Exception {

		pageMapper.noticeCount(boardNo);

	}

	/* 공지사항 끝 */

	@Override
	public boolean loginService(HttpSession session, PageVo vo) throws Exception {
		if (pageMapper.login(vo) == null) {
			System.out.println("Service : Fali");
			return false;
		} else {
			System.out.println("Service : Success");
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("userPw", vo.getUserPw());
			return true;
		}
	}
	@Override
	public List<PageVo> getCommentService(int boardNo) throws Exception {
		
		return pageMapper.getComment(boardNo);
	}
	
	@Override
	public void deleteCommentService(int commentNo)throws Exception  {
		
		pageMapper.deleteComment(commentNo);
		
	};
	
	@Override
	public void insertCommentService(PageVo vo)throws Exception  {
		
		pageMapper.insertComment(vo);
	};

	// 마이페이지
	@Override
	public PageVo myPageService(HttpSession session, String id) throws Exception {

		PageVo member = pageMapper.getUserInfo(id);
		System.out.println("myPageService ID : " + id);
		System.out.println(member);
		return member;
	}

	// 안씀
	@Override
	public String memberInfoService() throws Exception {

		List<PageVo> data = pageMapper.testDB();
		return data.get(0).getUserId();
	}

	// 나중에
	@Override
	public void fileUpload(PageVo pageVo, Boolean isLocal) throws Exception {

		String filePath = "/usr/local/리눅스 서버 경로.....";
		if (isLocal) {
			filePath = "C:\\egovframework\\upload/";
		}

		MultipartFile file = pageVo.getMpfile();
		String orgFileNm = file.getOriginalFilename();
		String fileExt = orgFileNm.substring(orgFileNm.lastIndexOf('.') + 1);
		String fileName = orgFileNm.substring(0, orgFileNm.lastIndexOf('.'));

		String fullFileName = fileName + "_" + new SimpleDateFormat("yyyyMMddhhmm").format(new Date()) + "." + fileExt;

		System.out.println(fullFileName);

		try {

			file.transferTo(new File(filePath + File.separator + fullFileName));
			pageVo.setFileName(orgFileNm);
			pageVo.setFileChangeName(fullFileName);
			pageVo.setFilePath((filePath + pageVo.getFileChangeName()));
			pageMapper.fileUploadLog(pageVo);

		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	@Override
	public List<PageVo> fileList() throws Exception {

		List<PageVo> list = pageMapper.fileList();

		return list;

	}

	@Override
	public List<PageVo> getTestData(int boardValue) throws Exception {

		List<PageVo> list = pageMapper.test(boardValue);

		return list;

	}
	
	@Override
	public PageVo fileDownload(PageVo pageVO) throws Exception{
		PageVo pageVo = pageMapper.fileDownload(pageVO);
		return pageVo;
	}
	
public int alter_userKey(String userId, String userKey) {
		
		int resultCnt = 0;
		pageMapper.alter_userKey(userId, userKey);
		return resultCnt;
		
		
	}
	// 이메일 난수 만드는 메서드
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String userEmail, String userId, String userName, HttpServletRequest request) {
		JavaMailSenderImpl mailSender= new JavaMailSenderImpl();
		String userKey = getKey(false, 20);
		pageMapper.getKey(userId, userKey);
		System.out.println(request.getParameter("userEmail"));
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mail, true, "UTF-8");
			messageHelper.setFrom("kiidb369@naver.com", "대전관광");
			messageHelper.setTo(request.getParameter("userEmail"));
			messageHelper.setSubject("본인인증");
			messageHelper.setText("<h2>안녕하세요 대전관광페이지입니다</h2><br><br>" 
						+"<h3>" + userName + "님</h3>" + "<h2><p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
						+ "<a href='http://localhost:8080" + request.getContextPath()
						+ "/key_alter.do?userId="+ userId +"&userKey="+userKey+"'>인증하기</a></p><h2>",true);
			mailSender.send(mail);
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	
	@Override
	public void insertnavermember(PageVo vo)throws Exception  {
		
		pageMapper.insertnavermember(vo);
	
	}

	@Override
	public int idcheck(String userId) throws Exception {
		return pageMapper.idcheck(userId);
	}

	@Override
	public int logincheck1(PageVo vo, HttpSession session) throws Exception {
		// 로그인 결과값
		
		String inputid = vo.getUserId();
		String inputpw = vo.getUserPw();
		String userId = vo.getUserId();
		System.out.println("service : " + inputid);
		System.out.println("service : " + inputpw);
		
		pageMapper.login(vo);
		PageVo id = pageMapper.ido(userId);
				int result = 0;
				String y = "Y";
				if (id == null) {
					System.out.println("1");
					result = 0;
					return result;
				}else if (!(id.getUserKey().equals(y))) {
					System.out.println("2");
					result = -1;
					return result;
				}else {
					System.out.println("3");
					System.out.println("Service.getUserKey : "+id.getUserKey());
					result=1;
					session.setAttribute("userId", vo.getUserId());
					session.setAttribute("userPw", vo.getUserPw());
				}
		return result;
	}

	public String idfind(String userName, String userBirth) {

		pageMapper.idfind(userName,userBirth);
		
		String result = "";
		System.out.println(userName);
		try {
			result = pageMapper.idfind(userName, userBirth);
		} catch (Exception e) {
			e.printStackTrace();
		};
		System.out.println(userBirth);
		System.out.println(userName);
		return result;
	}
	

	// 패스워드 찾기 이메일 발송
		public void mailSendWithPassword(String userId, String userEmail, HttpServletRequest request) {
			JavaMailSenderImpl mailSender= new JavaMailSenderImpl();
			// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
			String userKey = getKey(false, 6);
			
			// 회원 이름 꺼내는 코드
			PageVo vo = pageMapper.ido(userId);
			String userName = vo.getUserName();
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(mail, true, "UTF-8");
				messageHelper.setFrom("kiidb369@naver.com", "대전관광");;
				messageHelper.setTo(request.getParameter("userEmail"));
				messageHelper.setSubject("임시비밀번호 발급");
				messageHelper.setText("<h2>안녕하세요 '"+ userName +"' 님</h2><br><br>" 
						+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
						+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + userKey +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>",true);
				mailSender.send(mail);
			} catch (MessagingException | UnsupportedEncodingException e) { 
				e.printStackTrace();
			}
			pageMapper.searchPassword(userId, userEmail, userKey);
		}


		@Override
		public PageVo mypaging(String id) {
		
			return pageMapper.mypaging(id);
			
		}


		@Override
		public int userdelete(String id) {
			System.out.println("서비스"+id);
			return pageMapper.userdelete(id);
		}


		@Override
		public int editpw(String userPw, String userId) {
			HashMap<String,String> map=new HashMap<String,String>();
			map.put("userPw", userPw);
			map.put("userId", userId);
			
			return pageMapper.editpw(map); 
		}


		@Override
		public int editphone(String userPhone, String userId) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userPhone", userPhone);
			map.put("userId", userId);
			System.out.println("서비스아디"+map.put("userId", userId));
			System.out.println("서비스폰"+map.put("usePhone", userPhone));
			return pageMapper.editphone(map);
		}


		@Override
		public int editbirth(String userBirth, String userId) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userBirth", userBirth);
			map.put("userId", userId);
			
			return pageMapper.editbirth(map);
		}


		@Override
		public int editemail(String userEmail, String userId) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("userEmail", userEmail);
			map.put("userId", userId);
			
			return pageMapper.editemail(map);
		}
		
		 @Override
		   public void joinCheckService(PageVo vo) {
		      
		      pageMapper.joinCheck(vo);
		      
		   }
	
}
