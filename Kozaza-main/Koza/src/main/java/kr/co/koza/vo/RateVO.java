package kr.co.koza.vo;

public class RateVO {
	int rateIndex;         
	int contentIndex;
	int houseIndex;
	String houseAddress;
	String rateBug;
	String rateNoise;
	String rateLeak;
	String rateFungi;
	String rateStartLiving;
	String rateEndLiving;
	String rateVisitedTime;
	String rateImages;
			
	public RateVO() {
		super();
	}

	public RateVO(int rateIndex, int contentIndex, int houseIndex, String houseAddress, String rateBug,
			String rateNoise, String rateLeak, String rateFungi, String rateStartLiving, String rateEndLiving,
			String rateVisitedTime, String rateImages) {
		super();
		this.rateIndex = rateIndex;
		this.contentIndex = contentIndex;
		this.houseIndex = houseIndex;
		this.houseAddress = houseAddress;
		this.rateBug = rateBug;
		this.rateNoise = rateNoise;
		this.rateLeak = rateLeak;
		this.rateFungi = rateFungi;
		this.rateStartLiving = rateStartLiving;
		this.rateEndLiving = rateEndLiving;
		this.rateVisitedTime = rateVisitedTime;
		this.rateImages = rateImages;
	}

	public int getRateIndex() {
		return rateIndex;
	}

	public void setRateIndex(int rateIndex) {
		this.rateIndex = rateIndex;
	}

	public int getContentIndex() {
		return contentIndex;
	}

	public void setContentIndex(int contentIndex) {
		this.contentIndex = contentIndex;
	}

	public int getHouseIndex() {
		return houseIndex;
	}

	public void setHouseIndex(int houseIndex) {
		this.houseIndex = houseIndex;
	}

	public String getHouseAddress() {
		return houseAddress;
	}

	public void setHouseAddress(String houseAddress) {
		this.houseAddress = houseAddress;
	}

	public String getRateBug() {
		return rateBug;
	}

	public void setRateBug(String rateBug) {
		this.rateBug = rateBug;
	}

	public String getRateNoise() {
		return rateNoise;
	}

	public void setRateNoise(String rateNoise) {
		this.rateNoise = rateNoise;
	}

	public String getRateLeak() {
		return rateLeak;
	}

	public void setRateLeak(String rateLeak) {
		this.rateLeak = rateLeak;
	}

	public String getRateFungi() {
		return rateFungi;
	}

	public void setRateFungi(String rateFungi) {
		this.rateFungi = rateFungi;
	}

	public String getRateStartLiving() {
		return rateStartLiving;
	}

	public void setRateStartLiving(String rateStartLiving) {
		this.rateStartLiving = rateStartLiving;
	}

	public String getRateEndLiving() {
		return rateEndLiving;
	}

	public void setRateEndLiving(String rateEndLiving) {
		this.rateEndLiving = rateEndLiving;
	}

	public String getRateVisitedTime() {
		return rateVisitedTime;
	}

	public void setRateVisitedTime(String rateVisitedTime) {
		this.rateVisitedTime = rateVisitedTime;
	}

	public String getRateImages() {
		return rateImages;
	}

	public void setRateImages(String rateImages) {
		this.rateImages = rateImages;
	}

}
