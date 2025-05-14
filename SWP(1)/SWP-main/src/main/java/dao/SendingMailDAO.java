/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Properties;

/**
 *
 * @author caoqu
 */
@lombok.AllArgsConstructor
@lombok.NoArgsConstructor
public class SendingMailDAO extends Thread {

    private HttpServletResponse response;
    private HttpServletRequest request;
    private String reciveEmail;
    private String title;
    private String content;

    public void run() {
        String host = "smtp.gmail.com";
        String port = "465";
        String username = "caoquang139@gmail.com";
        String password = "ocwalevuuupyejar";

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", port); // for TLS
        props.put("mail.smtp.starttls.enable", "true"); // for TLS
        props.put("mail.smtp.ssl.enable", "true"); // for TLS

//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.port", port);
//        props.put("mail.debug", "true");
//        props.put("mail.smtp.socketFactory.port", port);
//        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//        props.put("mail.smtp.socketFactory.fallback", "false");
        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(reciveEmail));

            message.setSubject(title);
            message.setText(content);

            Transport.send(message);
            
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}
