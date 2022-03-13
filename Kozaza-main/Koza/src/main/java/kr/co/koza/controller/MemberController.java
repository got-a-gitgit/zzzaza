package kr.co.koza.controller;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.koza.mail.UserMailSendService;
import kr.co.koza.mapper.MemberSQLMapper;
import kr.co.koza.service.MemberService;
import kr.co.koza.vo.MemberVO;
import kr.co.koza.vo.SessionDataVO;

@Controller
public class MemberController {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private UserMailSendService mailSendService;
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	// 난수를 이용한 키 생성
	private boolean lowerCheck;
	private int size;
	
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	

	
		//로그인페이지으로 이동
		@RequestMapping("/loginForm")
		public String loginForm(HttpSession session) {
			if(session.getAttribute("sessionData")==null) {
				return "loginForm";
			}else {
				return "main";
			}
		}
		
		//로그인 프로세스
		@RequestMapping("/loginProcess")
		public String loginAction(MemberVO memberVo, HttpSession session) {
			if(session.getAttribute("sessionData")!=null) {
				return "main";
			}
			
			SessionDataVO sessionData = memberService.loginProcess(memberVo);
			
			if(sessionData != null) {
				// 로그인 성공
				session.setAttribute("sessionData", sessionData);
				
				return "redirect:/";
			}else {
				// 로그인 실패
			}
			return "loginFail";
		}
		
		// 로그 아웃
		@RequestMapping("/logoutAction")
		public String logoutAction(HttpSession session) {
			
			session.invalidate();
			return "redirect:main";
		}
		
		//회원가입 페이지로 이동
		@RequestMapping("/registerForm")
		public String registerForm() {
			return "registerForm";
		}
		
		// 회원가입 프로세스
		@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
		public String register(MemberVO memberVO, Model model, HttpServletRequest request) throws MessagingException {

			System.out.println("현재 가입한 회원: " + memberVO.toString());
			memberService.register(memberVO);
			
			
			String key = getKey(false, 20);
			memberSQLMapper.getAuthKey(memberVO.getMemberID(), key);
			
		    MimeMessage message = null;

		    MimeMessageHelper messageHelper = null;

			

	        message = mailSender.createMimeMessage();

	        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	      

	        //messageHelper.setSubject("123");

	       // messageHelper.setText("123", true);
	        
			String htmlStr = "<h2>안녕하세요 Kozaza입니다!</h2><br><br>" 
					+ "<h3>" + memberVO.getMemberID() + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
					+ "<a href='http://54.180.106.38:8080" + request.getContextPath() + "/key_alter?user_id="+ memberVO.getMemberID() +"&authKey="+key+"'>인증하기</a></p>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			message.setSubject("[본인인증] Kozaza 회원가입 인증메일입니다", "utf-8");
			message.setText(htmlStr, "utf-8", "html");
			message.addRecipient(RecipientType.TO, new InternetAddress(memberVO.getMemberEmail()));

	        

	        try {
				messageHelper.setFrom("Koza_Admin", "Koza_Admin");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        

	        messageHelper.setTo(memberVO.getMemberEmail());

	        

	        //messageHelper.addInline(contentId, dataSource);

	        

	        mailSender.send(message);			
			
			
			return "redirect:loginForm";

		}
		
		// 이메일 인증 프로세스
		@RequestMapping(value = "/key_alter", method = RequestMethod.GET)
		public String key_alterConfirm(@RequestParam("user_id") String user_id, @RequestParam("authKey") String key) {
			
			mailSendService.alterAuthKeyService(user_id, key);
			memberService.updateRankUp(user_id);
			
			return "registerSuccess";
		}
		
		// 아이디/비밀번호 찾기 페이지 이동
		@RequestMapping("/findInfoForm")
		public String findInfoForm() {
			
			
			return "findInfoForm";
		}
		
		@RequestMapping("/updateAction")
		public String updateAction(MemberVO requestParam) {
			memberService.update(requestParam);
			
			return "redirect:main";
		}

}
