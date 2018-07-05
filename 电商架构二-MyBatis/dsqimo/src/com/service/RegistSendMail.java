package com.service;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import org.springframework.stereotype.Service;

@Service
public class RegistSendMail {

	public void SendPassword(String eMail,String password) {
				// 获取服务器和协议
				Properties props = System.getProperties();
				props.put("mail.smtp.host", "smtp.163.com");
				props.put("mail.smtp.auth", "true");//设置需要身份验证
				
				// 创建session
				Session session = Session.getInstance(props, new Authenticator() {
					public PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("lyp_user", "luyanpu1996729");
					}
				});

				// 配置邮件
				MimeMessage message = new MimeMessage(session);
				try {
					// 发件人
					message.setFrom(new InternetAddress("lyp_user@163.com"));
					// 收件人
					message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(eMail));
					// 主题
					message.setSubject("找回密码");
					// 设置邮件的内容
					MimeBodyPart mimeBodyPart = new MimeBodyPart();
					mimeBodyPart.setContent("<h3>" + password+"</h3>", "text/html;charset=utf-8");
					// 创建multipart盒子
					MimeMultipart mimeMultipart = new MimeMultipart();
					mimeMultipart.addBodyPart(mimeBodyPart);
					// 盒子装入邮件
					message.setContent(mimeMultipart);
					message.setSentDate(new Date());
					Transport.send(message);
				} catch (AddressException e) {

					e.printStackTrace();
				} catch (MessagingException e) {

					e.printStackTrace();
				}
	}
	public void SendMail(String name, String eMail,int id) {
		// 获取服务器和协议
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.163.com");
		props.put("mail.smtp.auth", "true");//设置需要身份验证
		System.out.println(id);
		// 创建session
		Session session = Session.getInstance(props, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("lyp_user", "luyanpu1996729");
			}
		});

		// 配置邮件
		MimeMessage message = new MimeMessage(session);
		try {
			// 发件人
			message.setFrom(new InternetAddress("lyp_user@163.com"));
			// 收件人
			message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(eMail));
			// 主题
			message.setSubject("邮箱验证");
			// 设置邮件的内容
			MimeBodyPart mimeBodyPart = new MimeBodyPart();
			mimeBodyPart.setContent("<h3>" + name
					+ ",Thank you for your registration. Please click on the link below to complete your authentication:</h3>"
					+ "<a href='http://localhost:8080/dsqimo/loginAction/b?id="+id+"'"+">链接</a>", "text/html;charset=utf-8");
			// 创建multipart盒子
			MimeMultipart mimeMultipart = new MimeMultipart();
			mimeMultipart.addBodyPart(mimeBodyPart);
			// 盒子装入邮件
			message.setContent(mimeMultipart);
			message.setSentDate(new Date());
			Transport.send(message);
		} catch (AddressException e) {

			e.printStackTrace();
		} catch (MessagingException e) {

			e.printStackTrace();
		}
	}
}
