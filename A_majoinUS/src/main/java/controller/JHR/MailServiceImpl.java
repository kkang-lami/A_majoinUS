package controller.JHR;


import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{

	private JavaMailSender javaMailSender;
	 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }
 
    @Override
    public boolean send(String subject, String text, String from, String to) {
        // javax.mail.internet.MimeMessage
    	System.out.println("^__________________^");
        MimeMessage message = javaMailSender.createMimeMessage();
        System.out.println("★★★★★★★★★★★★★★★★★★★★★★★★\n"+message+"\n★★★★★★★★★★★★★★★★★★★★★★★★");
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

}
