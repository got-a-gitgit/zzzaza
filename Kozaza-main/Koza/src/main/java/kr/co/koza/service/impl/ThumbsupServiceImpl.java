package kr.co.koza.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.ContentSQLMapper;
import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.mapper.ThumbsupSQLMapper;
import kr.co.koza.service.ThumbsupService;
import kr.co.koza.vo.ThumbsupVO;

@Service
public class ThumbsupServiceImpl implements ThumbsupService{
	@Autowired
	private ThumbsupSQLMapper thumbsupSQLMapper;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private ContentSQLMapper contentSQLMapper;
	

	@Override
	public String thumbsupProcess(ThumbsupVO thumbsupVO) {
		String resultText = null;
		
		// Index를 ThumbsupVO에 넣어주면, 회원 index가 사용자에게 노출 됨
		// 그래서 불편하지만, 페이지에서 ID를 받아온 뒤 내부 로직으로 index 가져 옴
		if(thumbsupVO.getMemberID() == "") {
			return "로그인을 해 주세요";
		}
		int memberIndex = memberSQLMapper.getMemberIndexByID(thumbsupVO.getMemberID());
		thumbsupVO.setMemberIndex(memberIndex);
		String isThumbsUp = thumbsupSQLMapper.getIsThumbsupInfo(thumbsupVO);
		if(isThumbsUp == null) {
			thumbsupSQLMapper.insertThumbsup(thumbsupVO);
			contentSQLMapper.thumbsupCountUp(thumbsupVO.getContentIndex());
			resultText = "추천 되었습니다.";
		}else {
			resultText = "이미 추천 하셨습니다.";
		}
		return resultText;
	}
}
