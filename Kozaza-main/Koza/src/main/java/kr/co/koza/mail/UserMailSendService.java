package kr.co.koza.mail;


import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.koza.mapper.MemberSQLMapper;

@Service
public class UserMailSendService {
	
	
	
	
	@Autowired
	private MemberSQLMapper memberSQLMapper;
	
	// 이메일 난수 만드는 메서드
		

		// 회원가입 발송 이메일(인증키 발송)
		public void mailSendWithUserKey(String e_mail, String user_id, HttpServletRequest request) throws MessagingException {
			
			
			
			// 아마존 주소 : http://54.180.106.38/MS/user/key_alter?user_id=
			
		}
		
		//인증 확인 메서드
		public int alterAuthKeyService(String user_id, String key) {
			
			int resultCnt = 0;
			resultCnt = memberSQLMapper.updateAuthKey(user_id, key);
			
			return resultCnt;
		}



	




}
