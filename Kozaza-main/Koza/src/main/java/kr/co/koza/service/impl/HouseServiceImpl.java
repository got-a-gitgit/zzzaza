package kr.co.koza.service.impl;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.HouseSQLMapper;
import kr.co.koza.service.HouseService;
import kr.co.koza.vo.HouseVO;

@Service
public class HouseServiceImpl implements HouseService{

	@Autowired
	private HouseSQLMapper houseSQLMapper;
	
	
	@Override
	public ArrayList<HouseVO> getAllHouse() {
		ArrayList<HouseVO> houseList = houseSQLMapper.getAllHouseList();
		return houseList;
	}
	
	@Override
	public void insertHouseInfo(HouseVO houseVO) {
		
		if(houseVO.getHouseImages() == "") {
			houseVO.setHouseImages("none");
		}
		/* 개발 중에는 이 코드 활성화 해야 글 쓰기 가능
		if(houseVO.getHouseLatitude().equals("undefined")) {
			houseVO.setHouseLatitude("37.589059562355");
			houseVO.setHouseLongitude("127.028237557271");
		}
		*/
		houseSQLMapper.insertHouseInfo(houseVO);
	}

	@Override
	public int getMaxHouseIndex() {
		int maxHouseIndex = houseSQLMapper.getMaxHouseIndex();
		return maxHouseIndex;
	}
}
