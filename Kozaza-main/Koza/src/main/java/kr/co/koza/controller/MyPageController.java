package kr.co.koza.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.koza.service.MyPageService;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.ScrapVO;
import kr.co.koza.vo.SessionDataVO;

@Controller
public class MyPageController {
	
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("/myScrapPage")
	public String adminPage(HttpSession session, Model model) {
		// 권한 확인
		String result = myPageService.checkAuthority(session);
		if(!result.equals("authorized")) {
			return "redirect:"+result;
		}
		
		ArrayList<ContentVO> contentData = myPageService.getScrapList(session);
		model.addAttribute("contentData", contentData);
		
		return "myScrapPage";

	}

	@RequestMapping(value="/scrapProcess", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String scrapProcess(ScrapVO scrapVO) {
		String resultText = myPageService.scrapProcess(scrapVO);
		
		return resultText;
	}
	
	// 마이 페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		
		// 권한 확인
		String result = myPageService.checkAuthority(session);
		if(!result.equals("authorized")) {
			return "redirect:"+result;
		}

		// 회원 정보 가져오기 및 전달
		MemberVO member = myPageService.getMemberData(session);
		model.addAttribute("member", member);
		
		// 내가 쓴 글 가져오기 및 전달
		ArrayList<ContentVO> myContentData = myPageService.getMyPostList(session);
		model.addAttribute("myContentData", myContentData);

		// 스크랩한 글 가져오기 및 전달
		ArrayList<ContentVO> contentData = myPageService.getScrapList(session);
		model.addAttribute("contentData", contentData);		


		
		return "mypage";
	}
	
	// 마이 페이지 동작
	@RequestMapping("/mypageAction")
	public String mypageAction(MemberVO requestParam) {
		
		//memberService.update(requestParam);
		
		
		return "redirect:mypage";
	}
	
	@RequestMapping("/changeMemberInfoForm")
	public String changeMemberInfoForm(MemberVO memberVO, HttpSession session, Model model) {
		
		// 권한 확인
		String result = myPageService.checkAuthority(session);
		if(!result.equals("authorized")) {
			return "redirect:"+result;
		}
		SessionDataVO sessionData = (SessionDataVO)session.getAttribute("sessionData");
		model.addAttribute("sessionData", sessionData);
		return "changeMemberInfoForm";
	}

	@RequestMapping("/changeMemberInfoProcess")
	public String changeMemberInfoPorcess(MemberVO memberVO, HttpSession session, Model model) {

		// 권한 확인
		String result = myPageService.checkAuthority(session);
		if(!result.equals("authorized")) {
			return "redirect:"+result;
		}
		myPageService.changeMemberInfo(session);
		return "changeMemberInfoForm";
	}


}
