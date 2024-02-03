import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recipient = "fitiavanarazakarivony00@gmail.com";
        String subject = "ok";
        String content = "nok";

        String resultMessage = "";

        try {
            sendEmail(recipient, subject, content);
            resultMessage = "Le message a été envoyé avec succès à l'adresse : " + recipient;
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "Erreur lors de l'envoi du message : " + ex.getMessage();
        }

        request.setAttribute("resultMessage", resultMessage);
        request.getRequestDispatcher("admin/dashbord/Employeur.jsp").forward(request, response);
    }

    public void sendEmail(String recipient, String subject, String content) throws AddressException, MessagingException {
            String host = "smtp.gmail.com";
            String port = "587";
        final String username = "fitiavanarazakarivony00@gmail.com";
        final String password = "fitiavana290600";

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setText(content);

        Transport.send(message);
    }
}
