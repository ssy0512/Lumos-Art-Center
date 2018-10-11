package com.sp.admin.customer.lost;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class Email {

	public static void mailSend(String userEmail, String lostName, String status) {
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
            message.setSubject("[Lumos] 분실물 처리 상태"); //메일 제목을 입력

            // Text
            
            String mailText = 
            		"접수하신 분실물 [ " + lostName + " ] 에 대한 처리 상태는 [ " + status + " ] 입니다."
            		+"\r\n\r\n\r\n---------------------------------------------------------------\r\n\r\n\r\n"
            		+"분실물 처리상태 → 처리 :접수처리가 완료된 상태를 말합니다.\r\n " 
            		+"처리중 :분실한 물품을 확인하고 있는 상태를 말합니다.\r\n "
            		+"완료:데스크에 물품 보관중입니다. (2개월 초과시 인근 관할 경찰서로 인계)\r\n"		
            		+"분실물은 서비스플라자 INFORMATION&TICKETS 데스크에 보관합니다 2개월이 지난 습득물은 유실물법 제1조 (습득물의조치),유실물법 시행령 제 1조(습득물의제출)에 따라 ,\r\n 서초경찰서로 이관조치 됩니다"
            		;
            
            message.setText(mailText);    //메일 내용을 입력
            
            
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
