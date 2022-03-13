package kr.co.koza.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.koza.service.AdminService;
import kr.co.koza.vo.ContentVO;
import kr.co.koza.vo.DailyDataVO;
import kr.co.koza.vo.MemberVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
		
	@RequestMapping("/adminsPage")
	public String adminPage(MemberVO requestParam, HttpSession session, Model model) {
		// 접근 가능한지 판단
		boolean isAuthorized = adminService.checkAuthority(requestParam, session);
		if(isAuthorized != true) {
			return "redirect:notAllowedPage";
		}
		
		DailyDataVO dailyData =  adminService.getDailyDataVO();
		model.addAttribute("dailyData", dailyData);
		
		return "adminsPage";

	}
	
	@RequestMapping("/adminMemberForm")
	public String adminMemberForm(MemberVO requestParam, HttpSession session,
			Model model, String searchTarget, String searchWord) {
		// 접근 가능 판단
		boolean isAuthorized = adminService.checkAuthority(requestParam, session);
		if(isAuthorized != true) {
			return "redirect:notAllowedPage";
		}
		
		// DB에서 멤버 정보 받아오기
		ArrayList<MemberVO> memberData = adminService.getMemberDataForAdmin(searchTarget, searchWord);
		
		// 글 내용 model에 추가
		model.addAttribute("memberData", memberData);
		
		return "adminMemberForm";
	}
	
	@RequestMapping("/adminContentForm")
	public String adminContentForm(MemberVO requestParam, HttpSession session,
			Model model, String searchTarget, String searchWord) {
		// 접근 가능 판단
		boolean isAuthorized = adminService.checkAuthority(requestParam, session);
		if(isAuthorized != true) {
			return "redirect:notAllowedPage";
		}
		
		// DB에서 게시글 정보 받아오기
		ArrayList<ContentVO> contentData = adminService.getContentDataForAdmin(searchTarget, searchWord);

		// 글 내용 model에 추가
		model.addAttribute("contentData", contentData);
		
		return "adminContentForm";
	}
	
	@RequestMapping("/adminMemberRankChangeProcess")
	public String adminMemberRankChangeProcess(MemberVO requestParam, HttpSession session, HttpServletRequest request) {
		// 접근 가능 판단
		boolean isAuthorized = adminService.checkAuthority(requestParam, session);
		if(isAuthorized != true) {
			return "redirect:notAllowedPage";
		}

		// 선택한게 없으면 다시 원래 상태로
		String[] memberIDs = request.getParameterValues("memberID");
		if(memberIDs == null) {
			return "adminMemberForm";
		}
		
		// '강등' || '인증'
		String changeType = request.getParameter("changeType");
		
		// 회원 등급 변경
		adminService.changeRank(memberIDs, changeType);

		return "redirect:adminMemberForm";
	}
	
	@RequestMapping("/adminContentDeleteProcess")
	public String adminContentDeleteProcess(MemberVO requestParam, HttpSession session, HttpServletRequest request) {
		// 접근 가능 판단
		boolean isAuthorized = adminService.checkAuthority(requestParam, session);
		if(isAuthorized != true) {
			return "redirect:notAllowedPage";
		}

		// 선택한게 없으면 다시 원래 상태로
		String[] contentIndexes = request.getParameterValues("contentIndexes");
		if(contentIndexes == null) {
			return "redirect:adminContentForm";
		}
		
		// 회원 등급 변경
		adminService.deleteSelected(contentIndexes);

		return "redirect:adminContentForm";
	}
	
	// 접근 권한 없음
	@RequestMapping("/notAllowedPage")
	public String notAllowedPage() {
		return "notAllowedPage";
	}
	
	// 에러 처리 페이지
	@RequestMapping("/error")
	public String errorPage() {
		return "errorPage";
	}
	
	// 회원가입을 해 주세요
	@RequestMapping("/pleaseRegisterForm")
	public String pleaseRegisterForm() {
		return "pleaseRegisterForm";
	}
	
	// 회원 인증을 해 주세요
	@RequestMapping("/pleaseAuthorizeForm")
	public String pleaseAuthorizeForm() {
		return "pleaseAuthorizeForm";
	}
	
	// 강등 회원은 할 수 없습니다.
	@RequestMapping("/bannedProhibitedForm")
	public String bannedProhibitedForm() {
		return "bannedProhibitedForm";
	}
}
