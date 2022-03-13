package kr.co.koza.vo;

public class ReplyVO {
	private String replyIndex;
	private String contentIndex;
	private String memberNick;
	private String replyContent;
	private String replyWritedate;
	
	public ReplyVO() {
		
	}

	public ReplyVO(String replyIndex, String contentIndex, String memberNick, String replyContent,
			String replyWritedate) {
		super();
		this.replyIndex = replyIndex;
		this.contentIndex = contentIndex;
		this.memberNick = memberNick;
		this.replyContent = replyContent;
		this.replyWritedate = replyWritedate;
	}

	public String getReplyIndex() {
		return replyIndex;
	}

	public void setReplyIndex(String replyIndex) {
		this.replyIndex = replyIndex;
	}

	public String getContentIndex() {
		return contentIndex;
	}

	public void setContentIndex(String contentIndex) {
		this.contentIndex = contentIndex;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyWritedate() {
		return replyWritedate;
	}

	public void setReplyWritedate(String replyWritedate) {
		this.replyWritedate = replyWritedate;
	}


	
}
