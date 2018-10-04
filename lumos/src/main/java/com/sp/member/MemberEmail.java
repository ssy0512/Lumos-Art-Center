package com.sp.member;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class MemberEmail {
	
	public static void mailSend(String userEmail, String genPassword) {
        String user = "lumosadm1008@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
        String password = "lumos123456!";   // 패스워드

        // SMTP 서버 정보를 설정한다.
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); 
        prop.put("mail.smtp.port", 465); 
        prop.put("mail.smtp.auth", "true"); 
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail)); 

            // Subject
            message.setSubject("[Lumos] 회원 비밀번호 찾기 결과"); //메일 제목을 입력

            // Text
            message.setText("Lumos - 비밀번호 신규 발급 : " + genPassword);    //메일 내용을 입력

            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
