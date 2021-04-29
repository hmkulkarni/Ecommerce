package com.mycompany.ecommerce.others;

//import com.mycompany.ecommerce.entities.Contacted;
import com.mycompany.ecommerce.entities.User;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

    public static void sendEmail(String toEmail) {
        final String fromEmail = "hrishikesh2k01@gmail.com";
        final String password = "Hrishikesh@2001";
        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = prepareMessage(session, fromEmail, toEmail);

            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static Message prepareMessage(Session session, String fromEmail, String toEmail) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Thank you for contacting us!");
            message.setText("Thank you for connecting with us. We have received your feedback. We will get back to you as soon as possible on the given contact number.\n\n Regards");

        } catch (Exception ex) {
            Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
