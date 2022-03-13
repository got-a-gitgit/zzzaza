package kr.co.koza.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.ScrapVO;
import kr.co.koza.vo.SessionDataVO;

public interface MyPageService {

	// session 정보를 통해 myPage 관련 접근 권한 있는지 확인
	public String checkAuthority(HttpSession session);
	
	// session의 정보로 타겟 멤버 인덱스 가져 옴
	public int getMemberIndex(SessionDataVO sessionData);

	// 해당 멤버가 작성 한 글들(유효한 것) 가져 옴
	public ArrayList<ContentVO> getMyPostList(HttpSession session);
	
	// 해당 멤버가 스크랩 한 글들(유효한 것) 가져 옴
	public ArrayList<ContentVO> getScrapList(HttpSession session);

	
	// 스크랩 / 스크랩 취소 처리
	public String scrapProcess(ScrapVO scrapVO);
	
	// 닉네임으로 멤버 데이터 가져오기
	public MemberVO getMemberData(HttpSession session);
	
	// 회원 정보 변경
	public void changeMemberInfo(HttpSession session);
	
	
}
