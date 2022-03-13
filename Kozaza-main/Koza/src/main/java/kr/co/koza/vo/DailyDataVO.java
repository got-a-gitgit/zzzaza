package kr.co.koza.vo;

public class DailyDataVO {

	private int currentContentCount;
	private int currentMemberCount;
	private int yesterdayContentCount;
	private int yesterdayMemberCount;
	private int memberChanged;
	private int contentChanged;

	public DailyDataVO() {
		super();
	}

	public DailyDataVO(int currentContentCount, int currentMemberCount, int yesterdayContentCount,
			int yesterdayMemberCount, int memberChanged, int contentChanged) {
		super();
		this.currentContentCount = currentContentCount;
		this.currentMemberCount = currentMemberCount;
		this.yesterdayContentCount = yesterdayContentCount;
		this.yesterdayMemberCount = yesterdayMemberCount;
		this.memberChanged = memberChanged;
		this.contentChanged = contentChanged;
	}

	public int getCurrentContentCount() {
		return currentContentCount;
	}

	public void setCurrentContentCount(int currentContentCount) {
		this.currentContentCount = currentContentCount;
	}

	public int getCurrentMemberCount() {
		return currentMemberCount;
	}

	public void setCurrentMemberCount(int currentMemberCount) {
		this.currentMemberCount = currentMemberCount;
	}

	public int getYesterdayContentCount() {
		return yesterdayContentCount;
	}

	public void setYesterdayContentCount(int yesterdayContentCount) {
		this.yesterdayContentCount = yesterdayContentCount;
	}

	public int getYesterdayMemberCount() {
		return yesterdayMemberCount;
	}

	public void setYesterdayMemberCount(int yesterdayMemberCount) {
		this.yesterdayMemberCount = yesterdayMemberCount;
	}

	public int getMemberChanged() {
		return memberChanged;
	}

	public void setMemberChanged(int memberChanged) {
		this.memberChanged = memberChanged;
	}

	public int getContentChanged() {
		return contentChanged;
	}

	public void setContentChanged(int contentChanged) {
		this.contentChanged = contentChanged;
	}

	
	
}
