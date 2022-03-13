package kr.co.koza.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.koza.service.ContentService;
import kr.co.koza.service.HouseService;
import kr.co.koza.vo.HouseVO;

@Controller
public class MapController {

	@Autowired
	private HouseService houseService;
	@Autowired
	private ContentService contentService;
	
	
	private String kakaoKey = "58c04d21ebb3f336ef464140718532e0";
	
	@RequestMapping("/chooseLocationMap")
	public String chooseLocationMap(Model model, HttpSession session) {

		// 권한 체크
		String memberRank = contentService.checkAuthorityMember(0, session);
		if(memberRank.equals("pleaseRegisterForm")) {
			return memberRank;
		}
		// 회원 등급에 따라 다른 페이지로
		memberRank = contentService.checkMemberRank(memberRank);
		if(!memberRank.equals("authorized")) {
			return memberRank;
		}
		
		// kakao 키 내용 model에 추가
		model.addAttribute("kakaoKey", kakaoKey);
		
		ArrayList<HouseVO> houseList = houseService.getAllHouse();
		
		// 등록된 집들 model에 추가
		model.addAttribute("houseList", houseList);
		return "chooseLocationMap";
	}
	
	@RequestMapping("/toWritePostForm")
	public String toWritePostForm(HouseVO houseVO, HttpSession session, Model model) {

		// 권한 체크는 writePostForm에서
		String houseAddress = houseVO.getHouseAddress();
		if(houseAddress == null) {
			return "errorPage";
		}
		
		model.addAttribute("houseVO", houseVO);
		return "writePostForm";
	}
	
	@RequestMapping("/viewContentByMap")
	public String viewContentByMap(Model model) {
		// kakao 키 내용 model에 추가
		model.addAttribute("kakaoKey", kakaoKey);
		
		ArrayList<HouseVO> houseList = houseService.getAllHouse();
		
		// 등록된 집들 model에 추가
		model.addAttribute("houseList", houseList);
		return "viewContentByMap";
	}
	
	
	@RequestMapping("/searchByHouseAddress")
	public String searchByHouseAddress(String houseAddress, Model model) {
		
		return "./mypage";
	}
	
}
