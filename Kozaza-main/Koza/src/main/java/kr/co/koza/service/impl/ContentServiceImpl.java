package kr.co.koza.service.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.ContentSQLMapper;
import kr.co.koza.mapper.HouseSQLMapper;
import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.mapper.RateSQLMapper;
import kr.co.koza.service.ContentService;
import kr.co.koza.service.HouseService;
import kr.co.koza.vo.BoardDataVO;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.HouseVO;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.RateVO;
import kr.co.koza.vo.SessionDataVO;

@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	private ContentSQLMapper contentSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private HouseSQLMapper houseSQLMapper;

	@Autowired
	private RateSQLMapper rateSQLMapper;
	
//	@Autowired
//	private ReplySQLMapper replySQLMapper;
	
//	@Autowired
//	private ThumbsupSQLMapper thumbsupSQLMapper;
	
	@Autowired
	private HouseService houseService;

		
	@Override
	public ArrayList<BoardDataVO> getContentList(String searchTarget, String searchWord){
		
		ArrayList<BoardDataVO> datalist= new ArrayList<BoardDataVO>();
		ArrayList<ContentVO> contentList = null;
		if(searchWord == null) {
			contentList = contentSQLMapper.selectAll();
		}else {
			contentList = searchedContentList(searchTarget, searchWord);
		}
		for(ContentVO content : contentList) {
			BoardDataVO boardData = createBoardDataVO(content);
			
			datalist.add(boardData);
		}
		return datalist;
	}
	
	
	@Override
	public BoardDataVO getBoardDataVO(ContentVO requestParam) {
		int contentIndex = requestParam.getContentIndex();
		ContentVO content = contentSQLMapper.selectByIdx(contentIndex);
		BoardDataVO boardDataVO = getBoardDataByContentVO(content);
		
		return boardDataVO;
	}
	
	
	@Override
	public int writeContent(ContentVO contentVO, HouseVO houseVO, RateVO rateVO, HttpSession session) {

		// 세션 데이터로부터 멤버 정보 얻어온 뒤 contentVO에 넣는 과정
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		String memberNick = sessionData.getNick();
		int memberIndex = memberSQLMapper.getMemberIndexByID(sessionData.getUser_id());
		contentVO.setMemberNick(memberNick);
		contentVO.setMemberIndex(memberIndex);
		
		// 먼저 집 등록
		houseService.insertHouseInfo(houseVO);
		
		// house 관련 정보 contentVO, rateVO에 삽입
		int houseIndex = houseService.getMaxHouseIndex();
		contentVO.setHouseIndex(houseIndex);

		rateVO.setHouseIndex(houseIndex);
		rateVO.setHouseAddress(houseVO.getHouseAddress());
		
		// content, rate 등록
		contentSQLMapper.insert(contentVO);
		
		rateVO.setContentIndex(contentSQLMapper.getContentSequence());
		rateSQLMapper.insertData(rateVO);
		

		int recentIndex = contentSQLMapper.getContentSequence();
		return recentIndex;
	}
	
	@Override
	public void deleteContent(ContentVO requestParam) {
		contentSQLMapper.deleteByIdx(requestParam.getContentIndex());
	}
	
	public void updateContent(ContentVO requestParam) {
		contentSQLMapper.updateByIdx(requestParam);
	}


	@Override
	public void readCountUp(ContentVO requestParam) {
		contentSQLMapper.readCountUp(requestParam);
	}


	@Override
	public ArrayList<ContentVO> searchedContentList(String searchTarget, String searchWord) {
		
		ArrayList<ContentVO> contentList = null;

		// serchTarget 변수명으로 변경
		switch (searchTarget) {
		case "제목":
			searchTarget = "contentTitle";
			break;
		case "내용" :
			searchTarget = "contentContent";
			break;
		case "제목+내용" :
			searchTarget = "mixed";
			break;
		case "작성자" :
			searchTarget = "memberNick";
			break;
		default :
			searchTarget = "contentTitle";
			break;
		}
		
		// 검색어 좌우 공백 제거(검색 결과 혼동 방지용)
		searchWord = searchWord.trim();
		
		// 앞뒤에 다른 단어 있어도 검색 되게 변경
		searchWord = "%"+searchWord+"%";
		
		if(searchTarget != "mixed") {
			contentList = contentSQLMapper.selectBySearchWord(searchTarget, searchWord);
		}else {
			// 제목 + 내용 union table 만들어야
		}
		return contentList;
	}
	
	@Override
	public ArrayList<BoardDataVO> getMainPageBoardData(){
		ArrayList<ContentVO> contentList = contentSQLMapper.getTop5Data();
		ArrayList<BoardDataVO> boardList = new ArrayList<BoardDataVO>();
		for(ContentVO content : contentList) {
			
			BoardDataVO board = getBoardDataByContentVO(content);
			boardList.add(board);
		}
		return boardList;
	}
	

	
	@Override
	public BoardDataVO createBoardDataVO(ContentVO content) {

		BoardDataVO boardData = new BoardDataVO();
		
		// 작성자 관련 데이터
		MemberVO member = memberSQLMapper.selectByNick(content.getMemberNick());

		boardData.setContentVO(content);
		boardData.setMemberVO(member);
		
		return boardData;
	}
	
	/* ========= 관리자용 임시 시작 - 분리 가능성 존재 =========*/
	@Override
	public ArrayList<ContentVO> getContentDataForAdmin(){
		return contentSQLMapper.selectAll();
	}
	
	@Override
	public void deleteContentUsingContentIndex(int contentIndex) {
		contentSQLMapper.deleteByIdx(contentIndex);
	}
	/* ========= 관리자용 임시 끝 - 분리 가능성 존재 =========*/
	
	@Override
	public String convertContentType(int contentTypeInt) {
		String contentTypeString = null;
		switch(contentTypeInt) {
		case 1:{
			contentTypeString = "살아봤어요";
			break;
		}
		case 2:{
			contentTypeString = "친구집이에요";
			break;
		}
		case 3:{
			contentTypeString = "방문해봤어요";
			break;
		}
		default :
			contentTypeString = "살아봤어요";
		}
		return contentTypeString;
	}
	
	
	@Override
	public String checkAuthority(ContentVO contentVO, HouseVO houseVO, HttpSession session) {
		int memberIndex = contentVO.getMemberIndex();
		
		// 유효한 회원인지 체크, 유효하면 회원 등급 반환
		String memberRank = checkAuthorityMember(memberIndex, session);
		
		if(memberRank.equals("pleaseRegisterForm")) {
			return memberRank;
		}
		
		// adressLocationMap 제대로 거쳐서 왔는지 확인
		String checkRightPorcess = checkRightProcess(houseVO);
		if(!checkRightPorcess.equals("true")) {
			return checkRightPorcess;
		}
		
		// 회원 등급에 따라 다른 페이지로
		memberRank = checkMemberRank(memberRank);
		return memberRank;

	}
	
	@Override
	public String checkUpdateAuthority(String memberNick, HttpSession session) {
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		String sessionNick = sessionData.getNick();
		if(!memberNick.equals(sessionNick)) {
			return "notAllowedPage";
		}
		
		return "authorized";
	}
	
	
	@Override
	public String checkAuthorityMember(int memberIndex, HttpSession session) {
		String memberRank = null;
		
		// 접근 방지
		if(memberIndex == 0) {
			String memberNick = checkAuthorityBySession(session);
			
			if(memberNick.equals("pleaseRegisterForm")) {
				return memberNick;
			}
			
			memberRank = memberSQLMapper.selectByNick(memberNick).getMemberRank();
		}else {
			memberRank = memberSQLMapper.selectByIdx(memberIndex).getMemberRank();
		}
		return memberRank;
	}

	@Override
	public String checkAuthorityBySession(HttpSession session) {
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		if(sessionData == null) {
			return "pleaseRegisterForm";
		}

		String memberNick = sessionData.getNick();
		return memberNick;
	}
	
	@Override
	public String checkMemberRank(String memberRank) {
		switch(memberRank) {
		case "운영자" :
		case "인증" :
			return "authorized";
		
		case "비인증" :
			return "pleaseAuthorizeForm";
		
		case "강등" :
			return "bannedProhibitedForm";
			
		default : 
			return "pleaseRegisterForm";
		}
	}
	
	
	/* ==================== 이 application 자체에서 쓰는 logic 시작 ==================== */

	

	
	public String checkRightProcess(HouseVO houseVO) {
		if(houseVO.getHouseAddress() == null || houseVO.getHouseSpecificAddress() == null ||
				houseVO.getHouseLatitude() == null || houseVO.getHouseLongitude() == null) {
			return "chooseLocationMap";
		}
		return "true";
	}
	

	
	public BoardDataVO getBoardDataByContentVO(ContentVO contentVO) {
		int houseIndex = contentVO.getHouseIndex();
		MemberVO member = memberSQLMapper.selectByNick(contentVO.getMemberNick());
		HouseVO house = houseSQLMapper.selectByIndex(houseIndex);
		RateVO rate = rateSQLMapper.selectByContentIndex(contentVO.getContentIndex());
		
		BoardDataVO boardDataVO = new BoardDataVO(contentVO, member, house, rate);
		return boardDataVO;
	}
	
	/* ==================== 이 application 자체에서 쓰는 logic 끝 ==================== */

}
