package kr.co.koza.vo;

public class RestResponseDataVO {
	private boolean exist;
	private String reason;
	
	public RestResponseDataVO() {
		
	}

	public RestResponseDataVO(boolean exist, String reason) {
		super();
		this.exist = exist;
		this.reason = reason;
	}

	public boolean isExist() {
		return exist;
	}

	public void setExist(boolean exist) {
		this.exist = exist;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
}
