package kr.co.koza.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.koza.service.ContentService;
import kr.co.koza.service.ReplyService;
import kr.co.koza.vo.BoardDataVO;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.HouseVO;
import kr.co.koza.vo.RateVO;
import kr.co.koza.vo.ReplyVO;



@Controller
public class ContentController {
	
	
	@Autowired
	private ContentService contentService;
	@Autowired
	private ReplyService replyService;
	
	// 홈: 메인 페이지
	@RequestMapping("/")
	public String home(Model model) {
		return main(model);
	}
	
	// 메인 페이지
	@RequestMapping("/main")
	public String main(Model model) {
		ArrayList<BoardDataVO> boardDataList = contentService.getMainPageBoardData();
		model.addAttribute("boardDataList", boardDataList);
		
		// 글 읽을 때 contentType 변환 필요
		ArrayList<String> contentTypeStringList = new ArrayList<String>();		
		for(BoardDataVO boardData : boardDataList) {
			int contentTypeInt = boardData.getContentVO().getContentType();
			String contentTypeString = contentService.convertContentType(contentTypeInt);
			contentTypeStringList.add(contentTypeString);
		}
		model.addAttribute("contentTypeStringList", contentTypeStringList);

		return "main";
	}
	
	
	// 게시판 목록
	@RequestMapping("/PostBoard")
	public String PostBoard(Model model, String searchTarget, String searchWord) {
		ArrayList<BoardDataVO> list = contentService.getContentList(searchTarget, searchWord);
		model.addAttribute("boardDataList",list);
		
		return "PostBoard";
	}
	
	// 공지사항
	@RequestMapping("/NoticeBoard")
	public String NoticeBoard() {
		return "NoticeBoard";
	}
	
	// 글 작성 페이지
	@RequestMapping("/writePostForm")
	public String writePostForm(ContentVO contentVO, HouseVO houseVO, HttpSession session) {
		String writePostByRank = contentService.checkAuthority(contentVO, houseVO, session);
		if(writePostByRank == "authorized") {
			writePostByRank = "writePostForm";
		}
		return "redirect:"+writePostByRank;
	}
	
	// 글 작성 동작
	@RequestMapping("/writePostAction")
	public String writePostAction(ContentVO contentVO, HouseVO houseVO, RateVO rateVO, HttpSession session) {

		int contentIndex = contentService.writeContent(contentVO, houseVO, rateVO, session);
		
		return "redirect:readPostForm?contentIndex="+contentIndex;
	}
	
	// 글 삭제 동작
	@RequestMapping("/deletePostAction")
	public String deletePostAction(ContentVO requestParam) {
		
		contentService.deleteContent(requestParam);
		
		return "redirect:PostBoard";
	}
	
	// 글 수정 페이지
	@RequestMapping("/updatePostForm")
	public String updatePostForm(ContentVO contentVO, HttpSession session, Model model) {
		String memberNick = contentVO.getMemberNick();
		contentService.checkUpdateAuthority(memberNick, session);
		BoardDataVO data = contentService.getBoardDataVO(contentVO);
		
		String updateAuthorityAnswer = contentService.checkUpdateAuthority(memberNick, session);
		if(!updateAuthorityAnswer.equals("authorized")) {
			return updateAuthorityAnswer;
		}
		
		model.addAttribute("boardData",data);
		return "updatePostForm";
	}
	
	// 글 수정 동작
	@RequestMapping("/updatePostAction")
	public String updatePostAction(ContentVO requestParam) {
		
		contentService.updateContent(requestParam);
	
		return "redirect:readPostForm?contentIndex="+requestParam.getContentIndex();
	}
	
	// 글 읽기 페이지
	@RequestMapping("/readPostForm")
	public String readPost(ContentVO requestParam, Model model) {
		
		// 조회수 증가
		contentService.readCountUp(requestParam);
		
		// DB에서 글 내용 받아오기
		BoardDataVO boardData = contentService.getBoardDataVO(requestParam);

		// 글 읽을 때 contentType 변환 필요
		int contentTypeInt = boardData.getContentVO().getContentType();
		String contentTypeString = contentService.convertContentType(contentTypeInt);
		model.addAttribute("contentTypeString", contentTypeString);
		
		// 글 내용 model에 추가
		model.addAttribute("boardData", boardData);
		
		// 댓글 읽기
		ArrayList<ReplyVO> replyList = replyService.getReplyList(requestParam.getContentIndex());
		model.addAttribute("replyList", replyList);
		
		return "readPostForm";
	}
	
}
