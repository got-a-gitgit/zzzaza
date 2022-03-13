package kr.co.koza.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.DailyDataVO;
import kr.co.koza.vo.MemberVO;

public interface AdminService {

	// 랭크 체크로 접근 방지
	public boolean checkAuthority(MemberVO requestParam, HttpSession session);
	
	// 관리용 멤버 정보 가져오기
	public ArrayList<MemberVO> getMemberDataForAdmin(String searchTarget, String searchWord);
	
	// 관리용 글 정보 가져오기
	public ArrayList<ContentVO> getContentDataForAdmin(String searchTarget, String searchWord);
	
	// 회원 등급 변경
	public void changeRank(String[] memberIDs, String changeType);
	
	// 선택된 게시글 삭제
	public void deleteSelected(String[] contentIndexes);
	
	// 관리자 페이지 멤버 검색
	public ArrayList<MemberVO> searchedMemberListAdmin(String searchTarget, String searchWord);
	
	// 관리자 페이지 게시글 검색
	public ArrayList<ContentVO> searchedContentListAdmin(String searchTarget, String searchWord);

	
	// 매일 신규 게시글 수, 신규 회원 수 기록
	public void recordDailyUpdates();
	
	// 오늘, 어제 회원 및 게시글 수
	public DailyDataVO getDailyDataVO();
}
