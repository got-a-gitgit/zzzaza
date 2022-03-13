package kr.co.koza.vo;

public class ContentVO {
	private int contentIndex;           // 게시글 번호
	private int contentType;			// 게시글 종류(방문, 친구, 살아)
	private String contentTitle;        // 게시글 제목
	private int memberIndex;            // 작성자 회원 번호
	private String memberNick;          // 작성자 회원 닉네임
	private String contentContent;      // 게시글 내용
	private String contentWritedate;    // 게시글 작성일시
	private int contentCount;           // 게시글 조회수
	private int houseIndex;             // 평가할 집 번호
	private int contentRecommend;       // 게시글 추천 수
	private int contentReplyNum;        // 게시글 답변 수
	private String contentRoomNum;      // 방 호수
		
	
	public ContentVO() {
		
	}

	
	public ContentVO(int contentIndex, int contentType, String contentTitle, int memberIndex, String memberNick,
			String contentContent, String contentWritedate, int contentCount, int houseIndex, int contentRecommend,
			int contentReplyNum, String contentRoomNum) {
		super();
		this.contentIndex = contentIndex;
		this.contentType = contentType;
		this.contentTitle = contentTitle;
		this.memberIndex = memberIndex;
		this.memberNick = memberNick;
		this.contentContent = contentContent;
		this.contentWritedate = contentWritedate;
		this.contentCount = contentCount;
		this.houseIndex = houseIndex;
		this.contentRecommend = contentRecommend;
		this.contentReplyNum = contentReplyNum;
		this.contentRoomNum = contentRoomNum;
	}



	public int getContentIndex() {
		return contentIndex;
	}


	public void setContentIndex(int contentIndex) {
		this.contentIndex = contentIndex;
	}


	public int getContentType() {
		return contentType;
	}


	public void setContentType(int contentType) {
		this.contentType = contentType;
	}


	public String getContentTitle() {
		return contentTitle;
	}


	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}


	public int getMemberIndex() {
		return memberIndex;
	}


	public void setMemberIndex(int memberIndex) {
		this.memberIndex = memberIndex;
	}


	public String getMemberNick() {
		return memberNick;
	}


	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}


	public String getContentContent() {
		return contentContent;
	}


	public void setContentContent(String contentContent) {
		this.contentContent = contentContent;
	}


	public String getContentWritedate() {
		return contentWritedate;
	}


	public void setContentWritedate(String contentWritedate) {
		this.contentWritedate = contentWritedate;
	}


	public int getContentCount() {
		return contentCount;
	}


	public void setContentCount(int contentCount) {
		this.contentCount = contentCount;
	}


	public int getHouseIndex() {
		return houseIndex;
	}


	public void setHouseIndex(int houseIndex) {
		this.houseIndex = houseIndex;
	}


	public int getContentRecommend() {
		return contentRecommend;
	}


	public void setContentRecommend(int contentRecommend) {
		this.contentRecommend = contentRecommend;
	}


	public int getContentReplyNum() {
		return contentReplyNum;
	}


	public void setContentReplyNum(int contentReplyNum) {
		this.contentReplyNum = contentReplyNum;
	}


	public String getContentRoomNum() {
		return contentRoomNum;
	}


	public void setContentRoomNum(String contentRoomNum) {
		this.contentRoomNum = contentRoomNum;
	}

}
