package kr.co.koza.vo;

public class SessionDataVO {
	private String user_id;
	private String nick;
	private String memberRank;
	
	public SessionDataVO() {
		super();
	}

	public SessionDataVO(String user_id, String nick, String memberRank) {
		super();
		this.user_id = user_id;
		this.nick = nick;
		this.memberRank = memberRank;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getMemberRank() {
		return memberRank;
	}

	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}

	
	
}
