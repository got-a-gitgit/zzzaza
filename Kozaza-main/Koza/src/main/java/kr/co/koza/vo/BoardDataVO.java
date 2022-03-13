package kr.co.koza.vo;

public class BoardDataVO {
	private ContentVO contentVO;
	private MemberVO memberVO;
	private HouseVO houseVO;
	private RateVO rateVO;
//	private ThumbsupVO thumbsupVO;	//현재는 임시 처리, BoardData에서는 필요X
	
	public BoardDataVO() {
		
	}

	public BoardDataVO(ContentVO contentVO, MemberVO memberVO, HouseVO houseVO, RateVO rateVO) {
		super();
		this.contentVO = contentVO;
		this.memberVO = memberVO;
		this.houseVO = houseVO;
		this.rateVO = rateVO;
	}

	public ContentVO getContentVO() {
		return contentVO;
	}

	public void setContentVO(ContentVO contentVO) {
		this.contentVO = contentVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public HouseVO getHouseVO() {
		return houseVO;
	}

	public void setHouseVO(HouseVO houseVO) {
		this.houseVO = houseVO;
	}

	public RateVO getRateVO() {
		return rateVO;
	}

	public void setRateVO(RateVO rateVO) {
		this.rateVO = rateVO;
	}


	
}
