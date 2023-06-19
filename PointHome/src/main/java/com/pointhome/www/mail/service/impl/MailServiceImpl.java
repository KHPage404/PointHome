package com.pointhome.www.mail.service.impl;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.pointhome.www.mail.dao.face.MailDao;
import com.pointhome.www.mail.service.face.MailService;
import com.pointhome.www.user.dto.User;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired MailDao mailDao;
	@Autowired  private JavaMailSenderImpl mailSender;
	
	@Override
	public String chkUserEmail(String param) {

		String email = mailDao.selectUserEmailByEmail(param);
		return email;
	}

	@Override
	public int makeRandomNumber() {
		
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
	
		int authNumber = r.nextInt(888888) + 111111;
	
		return authNumber;
	}

	@Override
	public String joinEmail(String email, int authNumber) {
		makeRandomNumber();
		String setFrom = "dev.un7gi3@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[운칠기삼] 회원 가입 인증 이메일 입니다."; // 이메일 제목 
		String content = "";
		content += "홈페이지를 방문해주셔서 감사합니다."; 	//html 형식으로 작성 ! 
		content += "<br><br>";
		content += "인증 번호는 " + authNumber + "입니다."; 
		content += "<br>";
		content += "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입

		MimeMessage message = mailSender.createMimeMessage();

		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return Integer.toString(authNumber);
	}

	@Override
	public User updatePwEmail(User param, int authNumber) {
		makeRandomNumber();
		String setFrom = "dev.un7gi3@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = param.getUserEmail();
		String title = "[운칠기삼] 임시비밀번호 발급 이메일 입니다."; // 이메일 제목 
		String content = "";
		content += "안녕하세요. 운칠기삼입니다!"; 	//html 형식으로 작성 ! 
		content += "<br><br>";
		content += "발급된 임시 비밀번호는 " + authNumber + "입니다."; 
		content += "<br>";
		content += "임시비밀번호로 로그인 후 비밀번호를 바꾸어 주세요."; //이메일 내용 삽입

		MimeMessage message = mailSender.createMimeMessage();

		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		param.setUserPw(Integer.toString(authNumber));
		
		return param;
		
	}
	
}
