package kr.co.koza.vo;

public class MemberVO {
	private int	memberIndex;        // 회원 고유 번호
	private String	memberID;       // 회원 ID
	private String	memberPW;       // 회원 비밀번호
	private String	memberNick;     // 회원 닉네임
	private String	memberName;	    // 회원 이름
	private String	memberPhone;    // 회원 전화번호
	private String	memberEmail;    // 회원 이메일
	private String	memberJoinDate; // 회원 가입일
	private String	memberAuthKey;  // 회원 인증여부
	private String memberRank;		// 회원 등급(강퇴, 비인증, 인증, 운영자	)
	private int	memberPoint;        // 회원 포인트

	

	public MemberVO() {
		
	}



	public MemberVO(int memberIndex, String memberID, String memberPW, String memberNick, String memberName,
			String memberPhone, String memberEmail, String memberJoinDate, String memberAuthKey, String memberRank,
			int memberPoint) {
		super();
		this.memberIndex = memberIndex;
		this.memberID = memberID;
		this.memberPW = memberPW;
		this.memberNick = memberNick;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberJoinDate = memberJoinDate;
		this.memberAuthKey = memberAuthKey;
		this.memberRank = memberRank;
		this.memberPoint = memberPoint;
	}



	public int getMemberIndex() {
		return memberIndex;
	}



	public void setMemberIndex(int memberIndex) {
		this.memberIndex = memberIndex;
	}



	public String getMemberID() {
		return memberID;
	}



	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}



	public String getMemberPW() {
		return memberPW;
	}



	public void setMemberPW(String memberPW) {
		this.memberPW = memberPW;
	}



	public String getMemberNick() {
		return memberNick;
	}



	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberPhone() {
		return memberPhone;
	}



	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}



	public String getMemberEmail() {
		return memberEmail;
	}



	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}



	public String getMemberJoinDate() {
		return memberJoinDate;
	}



	public void setMemberJoinDate(String memberJoinDate) {
		this.memberJoinDate = memberJoinDate;
	}



	public String getMemberAuthKey() {
		return memberAuthKey;
	}



	public void setMemberAuthKey(String memberAuthKey) {
		this.memberAuthKey = memberAuthKey;
	}



	public String getMemberRank() {
		return memberRank;
	}



	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}



	public int getMemberPoint() {
		return memberPoint;
	}



	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	
	
}
