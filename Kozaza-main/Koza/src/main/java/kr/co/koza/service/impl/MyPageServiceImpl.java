package kr.co.koza.service.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.ContentSQLMapper;
import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.mapper.MyPageSQLMapper;
import kr.co.koza.service.MyPageService;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.ScrapVO;
import kr.co.koza.vo.SessionDataVO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageSQLMapper myPageSQLMapper;

	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	@Autowired
	private ContentSQLMapper contentSQLMapper;
	
	
	@Override
	public String checkAuthority(HttpSession session) {
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		
		if(sessionData == null) {
        	return "loginForm";
        }
		
        int memberIndex = getMemberIndex(sessionData);
        
        if(memberIndex == 0) {
        	return "notAllowedPage";
        }
		
		return "authorized";
	}
	
	
	@Override
	public int getMemberIndex(SessionDataVO sessionData) {
        String memberID = sessionData.getUser_id();
        int memberIndex = memberSQLMapper.getMemberIndexByID(memberID);
        return memberIndex;
	}
	
	@Override
	public ArrayList<ContentVO> getMyPostList(HttpSession session){
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		int memberIndex = getMemberIndex(sessionData);
		
		ArrayList<ContentVO> myContentList = myPageSQLMapper.getMyPostList(memberIndex);
		
		return myContentList;
	}
	
	@Override
	public ArrayList<ContentVO> getScrapList(HttpSession session){

		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		int memberIndex = getMemberIndex(sessionData);
		
		ArrayList<Integer> contentIndexes = myPageSQLMapper.getScrappedIndexesByMemberIndex(memberIndex);
		
		ArrayList<ContentVO> contentList = new ArrayList<ContentVO>();
		
		for(int contentIndex : contentIndexes) {
			ContentVO contentVO = contentSQLMapper.selectByIdx(contentIndex);
			if(contentVO == null) {
				continue;
			}
			contentList.add(contentVO);
		}
		
		return contentList;
	}

	@Override
	public String scrapProcess(ScrapVO scrapVO) {
		String resultText = null;
		
		// Index를 ThumbsupVO에 넣어주면, 회원 index가 사용자에게 노출 됨
		// 그래서 불편하지만, 페이지에서 ID를 받아온 뒤 내부 로직으로 index 가져 옴
		if(scrapVO.getMemberID() == "") {
			return "로그인을 해 주세요";
		}
		int memberIndex = memberSQLMapper.getMemberIndexByID(scrapVO.getMemberID());
		scrapVO.setMemberIndex(memberIndex);
		String isScrapped = myPageSQLMapper.getIsScrappedInfo(scrapVO);
		if(isScrapped == null) {
			myPageSQLMapper.insertScrap(scrapVO);
			resultText = "스크랩 되었습니다.";
		}else if(isScrapped.equals("1")){
			myPageSQLMapper.unScrap(scrapVO);
			resultText = "스크랩 취소 되었습니다.";
		}else {
			myPageSQLMapper.reScrap(scrapVO);
			resultText = "스크랩 되었습니다.";
		}
		return resultText;
	}

	@Override
	public MemberVO getMemberData(HttpSession session) {
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		MemberVO memberVO = memberSQLMapper.selectByNick(sessionData.getNick());
		return memberVO;
	}

	@Override
	public void changeMemberInfo(HttpSession session) {
		
	}
}
