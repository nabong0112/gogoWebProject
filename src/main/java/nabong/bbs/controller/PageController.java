package nabong.bbs.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import nabong.bbs.service.PageService;
import nabong.bbs.service.VisitCountService;
import nabong.bbs.service.impl.VisitCountServiceImpl;
import nabong.bbs.vo.PageVo;
import nabong.bbs.vo.PagingVo;

@Controller
public class PageController {
	@Autowired
	private PageService pageService;
	
	@Autowired
	private VisitCountService visitService;
	
	//도로명주소 삽입
			@RequestMapping(path="/sample.do")
			public String sample(Model mv) throws Exception {
				
				return "sample";

			}
			
			@RequestMapping("/popup/jusoPopup.do")
			public String jusoPopup(Model mv) throws Exception {
				
				return "/popup/jusoPopup";

			}
			
			
		//차트
		@RequestMapping("/chartEx.do")
		public String chartEx(Model mv) throws Exception {
			
			return "chartEx";

		}
		
		@RequestMapping(path="/daejeonMain.do")
		public String daejeonMain(Model mv) throws Exception {
			
			return "/gogoDaejeon/main";

		}
	
	

	// 아이디&비밀번호 찾기 폼
	@RequestMapping("/findUser.do")
	public String findUser(Model mv) throws Exception {

		return "find";

	}
	
	@RequestMapping("/visit.do")
	public String visit(Model mv) throws Exception {
		mv.addAttribute("today",visitService.getTodayCount());
		mv.addAttribute("total",visitService.getTotalCount());
		mv.addAttribute("get",visitService.getTime());
		return "/example/visit";

	}
	
	// 아이디&비밀번호 찾기 체크
	@RequestMapping("/findUserCheck.do")
	public String findUser(@ModelAttribute PageVo vo, Model mv, HttpSession session) throws Exception {

		if (pageService.findUserService(vo) == null) {
			String check = "no";
			mv.addAttribute("check", check);
			System.out.println("결과 없음");
			return "redirect:findUser.do";
		} else {
			String check = "Yes";
			mv.addAttribute("check", check);
			mv.addAttribute("find", pageService.findUserService(vo));
			System.out.println("결과 있음");
			return "redirect:findUser.do";
		}

	}

	// 회원가입 폼
	@RequestMapping("/join.do")
	public String join(Model mv) throws Exception {

		return "join";

	}

	// 회원가입
	@RequestMapping("/joinCheck.do")
	public String joinCheck(@ModelAttribute PageVo vo, Model mv) throws Exception {
		
		String check = pageService.joinService(vo);
		//아이디 중복체크
		if(check == "overlepId") {
			mv.addAttribute("check", check);	
			return "join";
		}else {
			mv.addAttribute("check", check);	
			return "login";
		}
	}

	// 메인
	@RequestMapping("/main.do")
	public String Main(Model mv, PageVo vo) throws Exception {

		List<PageVo> list = pageService.getnoticeService(1);
		List<PageVo> QnAList = pageService.getnoticeService(2);
		List<PageVo> FreeList = pageService.getnoticeService(3);

		mv.addAttribute("boardList", list);
		mv.addAttribute("QnAList", QnAList);
		mv.addAttribute("FreeList", FreeList);
		return "main";
	}

	// 로그인 화면
	@RequestMapping("/login.do")
	public String login(HttpSession session) {
		//관ㄹㅣ자기능 추가 통계(접속자 수 연령별 선호도 분포) 자바스크립트 차트 라이브러리 통계를 시각화하는 쿼리를 잘짜야함
		if (session.getAttribute("userId") == null) {
			return "login";

		} else {
			System.out.println("로그인되어있는경우에는 로그인창 갈수 없음");
			System.out.println("로그인 정보 : " + session.getAttribute("userId"));
			return "main";
		}
	}
	
	//로그인체크
		@RequestMapping("/loginCheck.do")
		public String loginCheck(HttpSession session, @ModelAttribute PageVo vo, Model model) throws Exception {

			boolean check = pageService.loginService(session, vo);

			if (check) {
				System.out.println("로그인 성공");
				System.out.println(session.getAttribute("userId"));
				System.out.println(session.getAttribute("userPw"));
				return "redirect:main.do";
			} else {
				System.out.println("로그인 실패");
				System.out.println(check);
				model.addAttribute("check", check);
				return "login";
			}

		}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();

		return "redirect:main.do";
	}
	
	//마이페이지
	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session, PageVo vo, Model model) throws Exception {
		String check = "login";

		if (session.getAttribute("userId") == null) {
			model.addAttribute("check", check);
			return "login";

		} else {
			String id = (String) session.getAttribute("userId");
			vo = pageService.myPageService(session, id);
			System.out.println(vo.getJoinTime());
			model.addAttribute("info", vo);
			return "myPage";
		}
	}
	
	//회원정보 수정 페이지
	@RequestMapping("/updateUserChcek.do")
	public String updateUserChcek(HttpSession session, PageVo vo, Model model) throws Exception {
		String check = "login";

		if (session.getAttribute("userId") == null) {
			model.addAttribute("check", check);
			return "login";

		} else {
			String id = (String) session.getAttribute("userId");
			vo = pageService.myPageService(session, id);
			System.out.println(vo.getJoinTime());
			model.addAttribute("info", vo);
			return "myPage";
		}
	}
	//회원정보 삭제
	@RequestMapping("/deleteUser.do")
	public String deleteUser(HttpSession session, PageVo vo, Model model) throws Exception {
		String check = "login";

		if (session.getAttribute("userId") == null) {
			model.addAttribute("check", check);
			return "login";

		} else {
			String id = (String) session.getAttribute("userId");
			vo = pageService.myPageService(session, id);
			System.out.println(vo.getJoinTime());
			model.addAttribute("info", vo);
			return "myPage";
		}
	}
	
	// 검색
	@RequestMapping("/search.do")
	public String noticeSearch(@RequestParam("boardValue") int boardValue, @ModelAttribute PageVo vo,
			@RequestParam(defaultValue = "1") int curPage, HttpSession session, Model mv) throws Exception {
		vo.setBoardValue(boardValue);
		List<PageVo> list = pageService.searchNoticeService(vo);
		mv.addAttribute("list", list);
		PagingVo paging = new PagingVo(5, 7, list.size(), curPage);
		mv.addAttribute("boardValue", boardValue);
		mv.addAttribute("page", paging);
		if (curPage > paging.getEndPage()) {
			curPage = 1;
			return "redirect:notice.do";
		}
		return "notice";
	}

	/* 공지사항 */
	// 목록
	@RequestMapping("/notice.do")
	public String noticeBoard(@RequestParam("boardValue") int boardValue, @RequestParam(defaultValue = "1") int curPage,
			HttpSession session, Model mv) throws Exception {

		List<PageVo> list = pageService.getnoticeService(boardValue);
		PagingVo paging = new PagingVo(5, 7, list.size(), curPage);
		mv.addAttribute("list", list);
		mv.addAttribute("boardValue", boardValue);
		mv.addAttribute("page", paging);
		if (curPage > paging.getEndPage()) {
			curPage = 1;
			return "redirect:notice.do";
		}
		return "notice";
	}

	// r
	@RequestMapping("/read.do")
	public String noticeRead(@RequestParam("boardNo") int boardNo, HttpSession session, Model mv) throws Exception {
		String check = "login";
		PageVo vo = pageService.readNoticeService(boardNo);

		if (session.getAttribute("userId") != null) {
			pageService.countNoticeService(boardNo);
			mv.addAttribute("list", vo);// 조회수
			mv.addAttribute("commentList", pageService.getCommentService(boardNo));// 댓글
			return "read";

		} else {
			mv.addAttribute("check", check);
			return "login";
		}
	}

	// c 화면
	@RequestMapping("/write.do")
	public String noticeWrite(String check, HttpSession session, Model mv) throws Exception {
		check = "write";
		if (session.getAttribute("userId") != null) {
			
			mv.addAttribute("check", check);
			return "write";
		} else {
			check = "login";
			mv.addAttribute("check", check);
			return "login";
		}
	}

	// u 화면
	@RequestMapping("/update.do")
	public String noticeUpdate(@RequestParam("check") String check, @RequestParam("boardNo") int boardNo,
			HttpSession session, Model mv) throws Exception {

		if (session.getAttribute("userId") != null) {
			mv.addAttribute("list", pageService.readNoticeService(boardNo));
			mv.addAttribute("check", check);
			return "write";
		} else {
			check = "login";
			mv.addAttribute("check", check);
			return "login";
		}
	}

	// c, u check
	@RequestMapping("/writeCheck.do")
	public String noticeWriteCheck(MultipartHttpServletRequest req, @RequestParam("check") String check,
			@ModelAttribute PageVo vo) throws Exception {

		String string = "write";
		boolean isLocal = false;
		Iterator<String> itr = req.getFileNames();

		String requestUrl = new String(req.getRequestURL());
		System.out.println(requestUrl);
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1")) {
			isLocal = true;
		}
		//파일정책 정하기

		while (itr.hasNext()) {
			MultipartFile mpf = req.getFile(itr.next());
			long fileSize = mpf.getSize();
			vo.setMpfile(mpf); // 파일
			if (check.equals(string)) {
				System.out.println("noticeWriteCheck : write " + vo.getBoardValue());
				System.out.println("파일 크기 : " + fileSize);
				pageService.insertNoticeService(vo);
				return "redirect:notice.do?boardValue=" + vo.getBoardValue();
			} else {
				System.out.println("noticeWriteCheck : update " + vo.getBoardNo());
				pageService.updateNoticeService(vo);
				return "redirect:notice.do?boardValue=" + vo.getBoardNo();
			}
		}
		return "redirect:notice.do?boardValue=" + vo.getBoardValue();
	}

	// d
	@RequestMapping("/delete.do")
	public String noticeDelete(@RequestParam("boardNo") int boardNo) throws Exception {

		System.out.println("noticeDelete : boardNo : " + boardNo);
		pageService.deleteNoticeService(boardNo);

		return "redirect:main.do";
	}

	/* 게시판 끝 */
	// 댓글 추가
	@RequestMapping("/insertComment.do")
	public String insertComment(@RequestParam("boardNo") int boardNo, @ModelAttribute PageVo vo) throws Exception {
		vo.setBoardNo(boardNo);

		pageService.insertCommentService(vo);

		return "redirect:read.do?boardNo=" + boardNo;
	}

	// 댓글 삭제
	@RequestMapping("/deleteComment.do")
	public String deleteComment(@RequestParam("boardNo") int boardNo, @RequestParam("commentNo") int commentNo)
			throws Exception {

		pageService.deleteCommentService(commentNo);

		return "redirect:read.do?boardNo=" + boardNo;
	}

	@RequestMapping("/upload.do")
	public String fileUploadTest() {

		System.out.println("~~");

		return "Upload";
	}
	//파일 업로드 할때
	@RequestMapping("/fileUpload.do")
	public String fileUploadTest(MultipartHttpServletRequest req, ModelAndView mv) throws Exception {

		System.out.println("파일 업로드 시작");
		Iterator<String> itr = req.getFileNames();

		boolean isLocal = false;
		PageVo vo = new PageVo();
		vo.setBoardUser(req.getParameter("boardUser"));// 유저아이디
		vo.setBoardTitle(req.getParameter("boardTitle"));// 제목
		vo.setBoardText(req.getParameter("boardText"));// 내용

		String requestUrl = new String(req.getRequestURL());
		System.out.println(requestUrl);
		if (requestUrl.contains("localhost") || requestUrl.contains("127.0.0.1")) {
			isLocal = true;
		}

		while (itr.hasNext()) {
			MultipartFile mpf = req.getFile(itr.next());

			vo.setMpfile(mpf); // 파일
			pageService.fileUpload(vo, isLocal);
		}

		return "Upload";
	}

	@RequestMapping(value = "/fileDownload.do")
	public String bbsFileDownload(HttpServletResponse response, @ModelAttribute("pageVo") PageVo pageVo,
			// 글번호
			@RequestParam(required = true, value = "boardNo") int boardNo, ModelMap model) throws Exception {
		// PageVo가 파일명, 경로, 크기 이런거 들어있는 Vo
		PageVo fileInfo = new PageVo();
		// 어떤글에 있는 파일인가 찾기위해서 wirtNum
		fileInfo.setBoardNo(boardNo);
		// 첨부파일 DB정보 가지고 오는거
		pageVo = pageService.fileDownload(fileInfo);
		byte[] fileByte;
		// atchFileVO.getFilePst() 저 부분에 저장경로 적어주면됨
		System.out.println(pageVo.getFilePath());
		fileByte = FileUtils.readFileToByteArray(new File(pageVo.getFilePath()));
		System.out.println(fileByte);
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		// encode 안에는 어떤 파일명으로 다운받을지, 저장할때 파일명이 변경되서 원래 이름 정보도 저장해서 그 이름으로 다운받게 함
		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(pageVo.getFileName(), "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		return "redirect:read.do?boardNo=" + boardNo;
	}

	@RequestMapping("/testDB.do")
	public @ResponseBody String testDB() throws Exception {

		return pageService.memberInfoService();
	}
}
