package kr.co.koza.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.koza.vo.RateVO;

public interface RateSQLMapper {

	//contentIndex로 집 관련 방 정보 가져오기
	@Select("SELECT * FROM RATE WHERE contentIndex = #{contentIndex}")
	public RateVO selectByContentIndex(@Param("contentIndex") int contentIndex);
	
	// houseIndex로 집 관련 방 정보 다 가져오기
	@Select("SELECT * FROM RATE WHERE houseIndex = #{houseIndex}")
	public RateVO selectByHouseIndex(@Param("houseIndex") int houseIndex);
	
	// 자료 입력하기
	@Insert("INSERT INTO RATE VALUES(RATE_SEQ.NEXTVAL, #{contentIndex}, #{houseIndex}, #{houseAddress}, #{rateBug}, #{rateNoise}, #{rateLeak}, #{rateFungi}, #{rateStartLiving}, #{rateEndLiving}, #{rateVisitedTime}, #{rateImages})")
	public void insertData(RateVO rateVO);
}
