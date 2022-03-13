package kr.co.koza.vo;

public class ThumbsupVO {
	private int contentIndex;
	private int memberIndex;
	private String memberID;
	private String isThumbsup;
	
	public ThumbsupVO() {
		super();
	}

	public ThumbsupVO(int contentIndex, int memberIndex, String memberID, String isThumbsup) {
		super();
		this.contentIndex = contentIndex;
		this.memberIndex = memberIndex;
		this.memberID = memberID;
		this.isThumbsup = isThumbsup;
	}

	public int getContentIndex() {
		return contentIndex;
	}

	public void setContentIndex(int contentIndex) {
		this.contentIndex = contentIndex;
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

	public String getIsThumbsup() {
		return isThumbsup;
	}

	public void setIsThumbsup(String isThumbsup) {
		this.isThumbsup = isThumbsup;
	}

}
