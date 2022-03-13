package kr.co.koza.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.koza.service.SearchService;
import kr.co.koza.service.impl.SearchServiceImpl;

@Controller
public class SearchController {
//	/*
//	public static void main(String[] args) {
//		// 실제로는 웹 페이지에서 선택하는 검색 조건
//		String searchTarget = "영화제목";
//		// 실제로는 웹 페이지에서 입력하는 검색어
//		String searchWord = "";
//		SearchController.Search(searchTarget, searchWord);
//	}
//	*/
//	@Autowired
//	private SearchService service;
//
//	// 검색어 searchWord가 parameter로 날아온다
//	@RequestMapping("/searchResult")
//	public String searchResult(String searchTarget, String searchWord,Model model) {
//		
//		/*
//		switch (searchTarget) {
//		case "영화제목":
//			searchTarget = "movieNm";
//			break;
//		case "영화장르" :
//			searchTarget = "genreAlt";
//			break;
//		case "영화감독" :
//			searchTarget = "directors";
//			break;
//		case "영화배우" :
//			searchTarget = "actor";
//			break;
//		case "줄거리" :
//			searchTarget = "synopsis";
//			break;
//		}
//		*/
//		ArrayList<MovieVO> movieVO = new ArrayList<MovieVO>();
//		// 좌우 공백 제거(검색 결과 혼동 방지용)
//		searchWord = searchWord.trim();
//		// 검색어 개수 따라 다른 결과
//		String[] searchWordParsed = searchWord.split(" ");
//		int SWPLength = searchWordParsed.length;
//		System.out.println(SWPLength);
//		/*
//		if (searchWord.length() == 0) {
//			// Ajax or alert로 "검색어를 입력해 주세요" 뜨게
//		} else {
//		}
//		*/
//				movieVO = service.searchByOneWord(searchTarget, searchWord);
//			
//			model.addAttribute("movie", movieVO);
//		for(MovieVO vo : movieVO) {
//			System.out.println(vo.getMovieNm());
//		}
//		return "searchResult";
//	}
}
