package kr.co.koza.service.impl;

import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.service.MemberService;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.SessionDataVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	
	@Override
	public void register(MemberVO memberVo) {
		// 회원가입
		memberSQLMapper.insert(memberVo);
		
	}

	@Override
	public SessionDataVO loginProcess(MemberVO memberVo) {
		MemberVO result = memberSQLMapper.selectById(memberVo.getMemberID());
		
		SessionDataVO sessionData = null;
		
		if(result != null && result.getMemberPW().equals(memberVo.getMemberPW())) {
			//로그인 성공
			sessionData = new SessionDataVO(result.getMemberID(), result.getMemberNick(), result.getMemberRank());
		} else {
			// 로그인 실패일 경우
			
		}
		
		return sessionData;
	}

	@Override
	public boolean isExistedID(MemberVO requestParam) {
		System.out.println(requestParam.getMemberID());
		MemberVO isExisted = memberSQLMapper.selectById(requestParam.getMemberID());
		
		// id가 null이 아닐 경우 id가 존재한다는 true 출력
		if(isExisted != null) {
			return true;
		}
		
		return false;
	}


	@Override
	public boolean isExistedNick(MemberVO requestParam) {
		System.out.println(requestParam.getMemberNick());
		MemberVO isExistedNick = memberSQLMapper.selectByNick(requestParam.getMemberNick());
		
		// nick가 null이 아닐 경우 nick가 존재한다는 true 출력
		if(isExistedNick != null) {
			return true;
		}
		
		return false;
	}
	
	
	@Override
	public MemberVO findId(MemberVO requestParam) {
		MemberVO idExist = memberSQLMapper.findId(requestParam);
		
		return idExist;
	}

	@Override
	public MemberVO findPw(MemberVO requestParam) {
		MemberVO idExist = memberSQLMapper.findPw(requestParam);
		
		return idExist;
	}

	
	@Override
	public MemberVO readMemberData(String memberNick) {
		MemberVO memberVO = memberSQLMapper.selectByNick(memberNick);
		
		return memberVO;
	}
	
	@Override
	public void update(MemberVO vo) {
		memberSQLMapper.update(vo);
	}

	@Override
	public void updateRankUp(String memberID) {
		memberSQLMapper.updateRankUp(memberID);
	}

	@Override
	public void updateRankDown(String memberID) {
		memberSQLMapper.updateRankDown(memberID);
	}
	
	
	// 회원가입 발송 이메일(인증키 발송)
	public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request) throws MessagingException {
				
	// 아마존 주소 : http://54.180.106.38/MS/user/key_alter?user_id=
				
	}
			
	// 인증 확인 메서드
	public int alterAuthKeyService(String user_id, String key) {

		int resultCnt = 0;
		resultCnt = memberSQLMapper.updateAuthKey(user_id, key);

		return resultCnt;
	}

	// 회원 등급 검색
	@Override
	public String checkMemberRank(MemberVO requestParam) {
		String memberNick = requestParam.getMemberNick();
		String memberRank = null;
		if(memberNick == null) {
			memberRank = "비회원";
		}else {
			memberRank = memberSQLMapper.checkMemberRank(memberNick);
		}

		return memberRank;
	}

	@Override
	public ArrayList<MemberVO> getMemberDataForAdmin(){
		ArrayList<MemberVO> memberList = memberSQLMapper.getMemberDataForAdmin();
		return memberList;
	}

}
