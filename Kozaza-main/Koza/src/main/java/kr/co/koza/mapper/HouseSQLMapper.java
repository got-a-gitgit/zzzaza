package kr.co.koza.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.koza.vo.HouseVO;

public interface HouseSQLMapper {

	// 전체 집 리스트 가져오기
	@Select("SELECT * FROM HOUSE")
	public ArrayList<HouseVO> getAllHouseList();
	
	// 집 인덱스로 집 찾기
	@Select("SELECT * FROM HOUSE WHERE houseIndex = #{houseIndex}")
	public HouseVO selectByIndex(@Param("houseIndex") int houseIndex);
	
	// HouseVO 정보 DB에 넣기
	@Insert("INSERT INTO HOUSE VALUES(HOUSE_SEQ.NEXTVAL, #{houseAddress}, #{houseSpecificAddress}, #{houseImages},#{houseLatitude}, #{houseLongitude})")
	public void insertHouseInfo(HouseVO houseVO);

	// houseIndex중 최고값 반환
	@Select("SELECT MAX(HOUSEINDEX) FROM HOUSE")
	public int getMaxHouseIndex();
}
