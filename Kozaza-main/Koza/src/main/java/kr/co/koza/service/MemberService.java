package kr.co.koza.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;

import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.SessionDataVO;

public interface MemberService {
	// 회원 가입
	public void register(MemberVO memberVo);
	
	// 로그인
	public SessionDataVO loginProcess(MemberVO memberVo);
	
	// 아이디 체크
	public boolean isExistedID(MemberVO requestParam);
	
	// 닉네임 체크
	public boolean isExistedNick(MemberVO requestParam);
	
	// 아이디 찾기
	public MemberVO findId(MemberVO requestParam);
	
	// 비밀번호 찾기
	public MemberVO findPw(MemberVO requestParam);

	// 닉네임으로 회원정보 받아오기
	public MemberVO readMemberData(String requestParam);
	
	// 회원 정보 수정
	public void update(MemberVO vo);
	
	// 회원 강등
	public void updateRankDown(String memberID);
	
	// 회원 강등 해제
	public void updateRankUp(String memberID);
	
	// 회원 등급 확인
	public String checkMemberRank(MemberVO requestParam);
	
	// 임시 - 관리용 멤버 정보 받아오기
	public ArrayList<MemberVO> getMemberDataForAdmin();
}
