package kr.co.koza.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import kr.co.koza.vo.BoardDataVO;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.HouseVO;
import kr.co.koza.vo.RateVO;

public interface ContentService {

	// 게시판 게시글 받아오기
	public ArrayList<BoardDataVO> getContentList(String searchTarget, String searchWord);

	// 게시글 정보 받아오기 (읽기, 수정용)
	public BoardDataVO getBoardDataVO(ContentVO requestParam);
	
	// 게시글 작성
	public int writeContent(ContentVO contentVO, HouseVO houseVO, RateVO rateVO, HttpSession session);
	
	// 게시글 삭제
	public void deleteContent(ContentVO requestParam);
	
	// 게시글 수정
	public void updateContent(ContentVO requestParam);
	
	// 게시글 읽기
	public void readCountUp(ContentVO requestParam);
	
	// 게시글 검색
	public ArrayList<ContentVO> searchedContentList(String searchTarget, String searchWord);

	// 메인페이지용 게시글 받아오기
	public ArrayList<BoardDataVO> getMainPageBoardData();
	
	
	// BoardDataVO 생성 
	public BoardDataVO createBoardDataVO(ContentVO content);
	
	
	
	// 임시 - 관리용 게시글 정보 받아오기
	public ArrayList<ContentVO> getContentDataForAdmin();
	
	// 임시 - 관리용 선택된 게시글 삭제 
	public void deleteContentUsingContentIndex(int contentIndex);
	
	
	// 게시판 읽기에서 쓸 contentType String형 반환
	public String convertContentType(int contentTypeInt);

	// 게시글 권한 확인
	public String checkAuthority(ContentVO contentVO, HouseVO houseVO, HttpSession session);
	
	// 수정 권한 확인
	public String checkUpdateAuthority(String memberNick, HttpSession session);
	
	// 멤버 인덱스, 세션을 확인하여 권한 확인
	public String checkAuthorityMember(int memberIndex, HttpSession session);

	// 세션만을 사용해서 권한 확인
	public String checkAuthorityBySession(HttpSession session);
	
	// 회원 등급에 따른 권한 확인
	public String checkMemberRank(String memberRank);
}
