package com.my.ERP.common.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


public class EmailSender {
	
	@Autowired
    protected JavaMailSender mailSender;
	
	public void SendEmail(Email email) throws Exception {
        
        MimeMessage msg = mailSender.createMimeMessage();
        MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
        
        try {
        	messageHelper.setFrom("sanghoo96@naver.com");	// 네이버는 지정해줘야함
        	messageHelper.setSubject(email.getSubject());
        	messageHelper.setText(email.getContent());
        	messageHelper.setTo(email.getReceiver());
           
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try {
            mailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }


	
}
