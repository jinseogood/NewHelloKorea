package com.kh.hello.common;

import java.io.FileNotFoundException;
import java.io.StringWriter;
import java.net.URISyntaxException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender; 
	}
	
	//일반 메일 전송
	public void sendMail(Email mail) throws FileNotFoundException, URISyntaxException{
		MimeMessage msg=mailSender.createMimeMessage();
		
		try{
			msg.setSubject(mail.getMailSubject());
			msg.setText(mail.getMailContent(), "utf-8", "html");
			msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(mail.getMailTo()));
			msg.setFrom(new InternetAddress(mail.getMailFrom()));  
			
			mailSender.send(msg);
		}
		catch(Exception e){
			System.out.println(e.getMessage());
		}
		
	}
	
}
