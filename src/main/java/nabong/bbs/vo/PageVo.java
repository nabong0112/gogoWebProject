package nabong.bbs.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PageVo {
	
	private MultipartFile mpfile;
	
	private String id;
	private String fileName;
	private Date date;
	private Date userLastLogin;
	/**
	 * 
	 */
	int boardValue;
	//회원정보
	private String userId;
	private String userPw;
	private String userName;
	private String joinTime;
	private String userIdQustion;
	private String userIdAnswer;
	private String userJender;
	private String userEmail;
	private String userKey;
	private String userPhone;
	private String userBirth;
	
	//네이버 로그인
	private String navername;
	private String naveremail;
	private String photoFile;
	private String photo;
	private String originalFilename;
	private String navernickname;
	private String userProfile;
	
	//게시글 정보
	int boardNo;
	private String boardTitle;
	private String boardText;
	private String boardUser;
	private String boardTime;
	int boardCount;
	String boardDateTime;
	//댓글 정보
	int commentNo;
	private String commentUser;
	private String commentText;
	private String commentTime;
	int recommentNo;
	private String recommentUser;
	private String recommentText;
	private String recommentTime;
	//검색 정보
	private String searchNo;
	private String searchName;
	
	//파일정보
	private String filePath;
	private String fileChangeName;
	
	
	
	public MultipartFile getMpfile() {
		return mpfile;
	}
	public void setMpfile(MultipartFile mpfile) {
		this.mpfile = mpfile;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(String joinTime) {
		this.joinTime = joinTime;
	}

	public String getUserIdQustion() {
		return userIdQustion;
	}

	public void setUserIdQustion(String userIdQustion) {
		this.userIdQustion = userIdQustion;
	}

	public String getUserIdAnswer() {
		return userIdAnswer;
	}

	public void setUserIdAnswer(String userIdAnswer) {
		this.userIdAnswer = userIdAnswer;
	}

	public String getUserJender() {
		return userJender;
	}

	public void setUserJender(String userJender) {
		this.userJender = userJender;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardText() {
		return boardText;
	}

	public void setBoardText(String boardText) {
		this.boardText = boardText;
	}

	public String getBoardUser() {
		return boardUser;
	}

	public void setBoardUser(String boardUser) {
		this.boardUser = boardUser;
	}

	public String getBoardTime() {
		return boardTime;
	}

	public void setBoardTime(String boardTime) {
		this.boardTime = boardTime;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public String getBoardDateTime() {
		return boardDateTime;
	}

	public void setBoardDateTime(String boardDateTime) {
		this.boardDateTime = boardDateTime;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public String getCommentUser() {
		return commentUser;
	}

	public void setCommentUser(String commentUser) {
		this.commentUser = commentUser;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}

	public int getRecommentNo() {
		return recommentNo;
	}

	public void setRecommentNo(int recommentNo) {
		this.recommentNo = recommentNo;
	}

	public String getRecommentUser() {
		return recommentUser;
	}

	public void setRecommentUser(String recommentUser) {
		this.recommentUser = recommentUser;
	}

	public String getRecommentText() {
		return recommentText;
	}

	public void setRecommentText(String recommentText) {
		this.recommentText = recommentText;
	}

	public String getRecommentTime() {
		return recommentTime;
	}

	public void setRecommentTime(String recommentTime) {
		this.recommentTime = recommentTime;
	}
	public int getBoardValue() {
		return boardValue;
	}
	public void setBoardValue(int boardValue) {
		this.boardValue = boardValue;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileChangeName() {
		return fileChangeName;
	}
	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}
	public String getSearchNo() {
		return searchNo;
	}
	public void setSearchNo(String searchNo) {
		this.searchNo = searchNo;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public Date getUserLastLogin() {
		return userLastLogin;
	}
	public void setUserLastLogin(Date userLastLogin) {
		this.userLastLogin = userLastLogin;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserKey() {
		return userKey;
	}
	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getNavername() {
		return navername;
	}
	public void setNavername(String navername) {
		this.navername = navername;
	}
	public String getNaveremail() {
		return naveremail;
	}
	public void setNaveremail(String naveremail) {
		this.naveremail = naveremail;
	}
	public String getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(String photoFile) {
		this.photoFile = photoFile;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getNavernickname() {
		return navernickname;
	}
	public void setNavernickname(String navernickname) {
		this.navernickname = navernickname;
	}
	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	

}
