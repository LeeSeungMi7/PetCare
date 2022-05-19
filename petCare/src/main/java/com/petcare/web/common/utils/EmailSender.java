package com.petcare.web.common.utils;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;

@Configuration
public class EmailSender {
	
	@Autowired
	protected JavaMailSender mailSender;
	
	public void SendEmail(Email email)throws Exception{
		MimeMessage msg = mailSender.createMimeMessage();
//		System.out.println("메일보내기");
		
		try {
			msg.setSubject(email.getSubject()); //제목
			msg.setText(email.getContent()); //내용
			msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver())); //수신자
		}catch(MessagingException e) {
			System.out.println("MessagingException발생");
			e.printStackTrace();
		}
		
		try {
			mailSender.send(msg);
		}catch(MailException e) {
			System.out.println("MailException 발생");
			e.printStackTrace();
		}
	}
}
