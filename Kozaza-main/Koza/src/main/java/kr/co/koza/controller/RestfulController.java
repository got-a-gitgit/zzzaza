package kr.co.koza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.koza.service.MemberService;
import kr.co.koza.vo.*;



@Controller
@ResponseBody
public class RestfulController {
	@Autowired
	private MemberService memberService;

	
	@RequestMapping("/testRest")
	public String test() {
		
		return "AAAAA";
	}
	
	/* Restful API 잘 활용하는 법
	 * 1. 서버 컨트롤러 구현(ResponseBody)
	 * 2. AJAX(javascript)로 호출
	 * 3. 의미있는 데이터를 받고.. 의도에 맞게 UI를 Javascirpt로 만들어낸다.
	 */
	@RequestMapping("/isExistedID")
	public RestResponseDataVO isExistID(MemberVO requestParam) {
		
		RestResponseDataVO result = new RestResponseDataVO();
		
		if(memberService.isExistedID(requestParam)) {
			result.setExist(true);
			result.setReason("아이디가 존재합니다.");
		}
		return result;
	}
	
	@RequestMapping("/isExistedNick")
	public RestResponseDataVO isExistNick(MemberVO requestParam) {
		
		RestResponseDataVO result = new RestResponseDataVO();
		
		if(memberService.isExistedNick(requestParam)) {
			result.setExist(true);
			result.setReason("닉네임이 존재합니다.");
		}
		return result;
	}
	
	// 아이디 찾기
	@SuppressWarnings("null")
	@RequestMapping("/findId")
	public MemberVO findId(MemberVO requestParam) {
		System.out.println(requestParam.getMemberName());
		MemberVO result = memberService.findId(requestParam);
		System.out.println(result);
		if(result == null) {
			result = new MemberVO();
		}
		return result;
	}
	
	// 비밀번호 찾기
	@SuppressWarnings("null")
	@RequestMapping("/findPw")
	public MemberVO findPw(MemberVO requestParam) {
		System.out.println("들어옴");
		System.out.println(requestParam.getMemberID());
		MemberVO result = memberService.findPw(requestParam);
		System.out.println(result);
		if(result == null) {
			result = new MemberVO();
		}
		return result;
	}
	
	
	
}
