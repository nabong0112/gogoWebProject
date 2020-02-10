package nabong.bbs.vo;

public class VisitCountVo {
	private String visitId; //접속자 id
	
    private String visitIp; //접속자 ip
    
    private int visitDate; //접속자 날짜
    
    private String visitRefer; //접속자 접속 경로
    
    private String visitAgent; //접속자 브라우저 정보

	public String getVisitId() {
		return visitId;
	}

	public void setVisitId(String visitId) {
		this.visitId = visitId;
	}

	public String getVisitIp() {
		return visitIp;
	}

	public void setVisitIp(String visitIp) {
		this.visitIp = visitIp;
	}

	public int getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(int visitDate) {
		this.visitDate = visitDate;
	}

	public String getVisitRefer() {
		return visitRefer;
	}

	public void setVisitRefer(String visitRefer) {
		this.visitRefer = visitRefer;
	}

	public String getVisitAgent() {
		return visitAgent;
	}

	public void setVisitAgent(String visitAgent) {
		this.visitAgent = visitAgent;
	}

	
	
}
