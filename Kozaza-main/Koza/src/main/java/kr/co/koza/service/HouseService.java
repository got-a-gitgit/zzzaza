package kr.co.koza.service;

import java.util.ArrayList;

import kr.co.koza.vo.HouseVO;

public interface HouseService {

	// 모든 집 정보 불러오기
	public ArrayList<HouseVO> getAllHouse();
	
	// 집 정보 추가
	public void insertHouseInfo(HouseVO houseVO);
	
	// houseIndex중 최고값 불러오기
	public int getMaxHouseIndex();
}
