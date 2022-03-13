package kr.co.koza.service.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.AdminSQLMapper;
import kr.co.koza.mapper.ContentSQLMapper;
import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.service.AdminService;
import kr.co.koza.service.ContentService;

import kr.co.koza.service.MemberService;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.SessionDataVO;
import kr.co.koza.vo.DailyDataVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private MemberService memberService;
	@Autowired
	private ContentService contentService;
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	@Autowired
	private ContentSQLMapper contentSQLMapper;
	@Autowired
	private AdminSQLMapper adminSQLMapper;
	

	@Override
	public boolean checkAuthority(MemberVO requestParam, HttpSession session) {
		String memberRank = null;
		int memberIndex = requestParam.getMemberIndex();
		// 접근 방지
		memberRank = contentService.checkAuthorityMember(memberIndex, session);

		// 글 내용 model에 추가
		if(!memberRank.equals("운영자")) {
			return false;
		} else {
			return true;
		}
	}


	@Override
	public ArrayList<MemberVO> getMemberDataForAdmin(String searchTarget, String searchWord) {
		
		ArrayList<MemberVO> memberList= new ArrayList<MemberVO>();
		if(searchWord == null) {
			memberList = memberSQLMapper.getMemberDataForAdmin();
		}else {
			memberList = searchedMemberListAdmin(searchTarget, searchWord);
		}
		
		return memberList;
	}


	@Override
	public ArrayList<ContentVO> getContentDataForAdmin(String searchTarget, String searchWord) {
		
		ArrayList<ContentVO> contentList= new ArrayList<ContentVO>();
		if(searchWord == null) {
			contentList = contentSQLMapper.selectAll();
		}else {
			contentList = searchedContentListAdmin(searchTarget, searchWord);
		}
		
		return contentList;
	}
	
	@Override
	public void changeRank(String[] memberIDs, String changeType) {
		if(changeType.equals("강등")) {
			for(String memberID : memberIDs) {
				memberService.updateRankDown(memberID);
			}
		}else {
			for(String memberID : memberIDs) {
				memberService.updateRankUp(memberID);
			}
		}
	}
	
	@Override
	public void deleteSelected(String[] contentIndexes) {
		ArrayList<Integer> contentIndexesInt = new ArrayList<Integer>();
		for(String contentIndex : contentIndexes) {
			contentIndexesInt.add(Integer.parseInt(contentIndex));
		}
		
		for(int contentIndexInt : contentIndexesInt) {
			contentService.deleteContentUsingContentIndex(contentIndexInt);
		}
	}

	@Override
	public ArrayList<MemberVO> searchedMemberListAdmin(String searchTarget, String searchWord) {
		
		ArrayList<MemberVO> memberList = null;

		// serchTarget 변수명으로 변경
		switch (searchTarget) {
		case "회원 닉네임":
			searchTarget = "memberNick";
			break;
		case "회원 아이디" :
			searchTarget = "memberID";
			break;
		case "회원 번호" :
			searchTarget = "memberIndex";
			break;
		case "회원 등급" :
			searchTarget = "memberRank";
			break;
		default :
			searchTarget = "memberNick";
			break;
		}
		
		// 검색어 좌우 공백 제거(검색 결과 혼동 방지용)
		searchWord = searchWord.trim();
		
		// 앞뒤에 다른 단어 있어도 검색 되게 변경
		searchWord = "%"+searchWord+"%";
		
		memberList = memberSQLMapper.selectBySearchWord(searchTarget, searchWord);
		return memberList;
	}
	
	@Override
	public ArrayList<ContentVO> searchedContentListAdmin(String searchTarget, String searchWord){
		
		ArrayList<ContentVO> contentList = null;

		// serchTarget 변수명으로 변경
		switch (searchTarget) {
		case "제목":
			searchTarget = "contentTitle";
			break;
		case "내용" :
			searchTarget = "contentContent";
			break;
		case "게시글 종류" :
			searchTarget = "contentType";
			break;
		case "작성자" :
			searchTarget = "memberNick";
			break;
		default :
			searchTarget = "memberNick";
			break;
		}
		
		// 검색어 좌우 공백 제거(검색 결과 혼동 방지용)
		searchWord = searchWord.trim();
		
		// 앞뒤에 다른 단어 있어도 검색 되게 변경
		searchWord = "%"+searchWord+"%";
		
		contentList = contentSQLMapper.selectBySearchWord(searchTarget, searchWord);
		
		return  contentList;
	}
	
	@Override
	@Scheduled(cron = "0 59 14 * * *") // 톰캣 서버가 그리니치 표준시라, 한국보다 9시간 느림
	public void recordDailyUpdates() {
		// getDailyDataVO 함수에서 사용하는 쿼리문 변경하여 중복으로 들어가도 괜찮게 변경
		System.out.println("=====오늘 데이터 기록 시작합니다====");
		int todayMemberCount = adminSQLMapper.getCurrentMemberCount();
		int todayContentCount = adminSQLMapper.getCurrentContentCount();
		adminSQLMapper.putTodayAllCount(todayMemberCount, todayContentCount);
		System.out.println("=====오늘 데이터 기록 완료했습니다====");
	}


	@Override
	public DailyDataVO getDailyDataVO() {
		int currentContentCount = adminSQLMapper.getCurrentContentCount();
		int currentMemberCount = adminSQLMapper.getCurrentMemberCount();
		// 실수로 DB에 여러번 들어갈 수도 있음. SQL에서 ArrayList로 가져온 뒤, 첫번째 값 선택
		int yesterdayContentCount = adminSQLMapper.getYesterdayContentCount().get(0);
		int yesterdayMemberCount = adminSQLMapper.getYesterdayMemberCount().get(0);
		int contentChanged = currentContentCount - yesterdayContentCount;
		int memberChanged = currentMemberCount - yesterdayMemberCount;
		
		DailyDataVO dailyDataVO = new DailyDataVO(currentContentCount, currentMemberCount, yesterdayContentCount, yesterdayMemberCount, memberChanged, contentChanged);
		return dailyDataVO;
	}
	
	
}
