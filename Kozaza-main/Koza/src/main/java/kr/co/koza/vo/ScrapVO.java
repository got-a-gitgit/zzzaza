package kr.co.koza.vo;

public class ScrapVO {
	private int contentIndex;
	private int memberIndex;
	private String memberID;
	private String isScrapped;

	public ScrapVO() {
		super();
	}

	public ScrapVO(int contentIndex, int memberIndex, String memberID, String isScrapped) {
		super();
		this.contentIndex = contentIndex;
		this.memberIndex = memberIndex;
		this.memberID = memberID;
		this.isScrapped = isScrapped;
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

	public String getIsScrapped() {
		return isScrapped;
	}

	public void setIsScrapped(String isScrapped) {
		this.isScrapped = isScrapped;
	}

	
	
}
