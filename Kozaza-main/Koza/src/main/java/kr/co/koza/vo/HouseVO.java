package kr.co.koza.vo;

public class HouseVO {
	private int houseIndex;
	private String houseAddress;
	private String houseSpecificAddress;
	private String houseImages;
	private String houseLatitude;
	private String houseLongitude;

	public HouseVO() {
		super();
	}

	public HouseVO(int houseIndex, String houseAddress, String houseSpecificAddress, String houseImages,
			String houseLatitude, String houseLongitude) {
		super();
		this.houseIndex = houseIndex;
		this.houseAddress = houseAddress;
		this.houseSpecificAddress = houseSpecificAddress;
		this.houseImages = houseImages;
		this.houseLatitude = houseLatitude;
		this.houseLongitude = houseLongitude;
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

	public String getHouseSpecificAddress() {
		return houseSpecificAddress;
	}

	public void setHouseSpecificAddress(String houseSpecificAddress) {
		this.houseSpecificAddress = houseSpecificAddress;
	}

	public String getHouseImages() {
		return houseImages;
	}

	public void setHouseImages(String houseImages) {
		this.houseImages = houseImages;
	}

	public String getHouseLatitude() {
		return houseLatitude;
	}

	public void setHouseLatitude(String houseLatitude) {
		this.houseLatitude = houseLatitude;
	}

	public String getHouseLongitude() {
		return houseLongitude;
	}

	public void setHouseLongitude(String houseLongitude) {
		this.houseLongitude = houseLongitude;
	}

	
}
