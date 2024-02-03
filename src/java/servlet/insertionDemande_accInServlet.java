package servlet;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import table.annonce;
import table.contact;
import table.demande_accExt;
import table.demande_accInt;
import table.demande_refInt;
import table.demandeurExt;
import table.demandeurInt;
import table.nosmetier;
import table.test;

import java.awt.HeadlessException;
import java.io.*;

import javax.servlet.http.*;
import java.security.Security;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;
import table.testeInter;
// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertionDemande_accInServlet extends HttpServlet {
    private String message;

    @Override
    public void init() {
        message = "Hello World!";
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        Connection bdd = Connexion.connect();
        HttpSession session = request.getSession();

  
       // ------- INSERTION -----
            /* String pseudo_accex = request.getParameter("pseudo"); 
             String mdp_accex = request.getParameter("mdp");        
             String accepter = request.getParameter("accepter");*/
        
        String type = "Attender";       
        String id_eurIn = request.getParameter("id");
        out.println(id_eurIn);         
        out.println("1");   


      try{
            
           // MESSAGE EMAIL
                //------ code ------    
            final String USERNAME = "fitiavanarazakarivony00@gmail.com";
            final String PASSWORD = "yhnwxpglndbxyecn";     
            
            String sujet = "Date du teste d'embauche";     
            String contenu = request.getParameter("date");   
            String heure = request.getParameter("heure");    
   
            String destinataire = request.getParameter("recipient");
        
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.ssl.checkserveridentity", true); 

            Session session1 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(USERNAME, PASSWORD);
                }
            });

        try {
            Message message = new MimeMessage(session1);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destinataire));
            message.setSubject(sujet);
            message.setText("Madame, Monsieur,\n" +
            "\n" +
            "Je vous remercie pour l'intérêt que vous portez à notre entreprise ." +
            "\n" +
            "Nous avons le plaisir de vous informer que le test d'embauche est prévu pour le "+contenu+" à "+heure+" dans nos locaux situés à Value-IT.\n" +
            "\n" +
            "Nous vous conseillons de vous préparer en conséquence et de vous munir de tout matériel nécessaire pour le test. Si vous avez des questions ou des préoccupations, n'hésitez pas à nous contacter.\n" +
            "\n" +
            "Nous espérons vous voir bientôt et vous souhaitons bonne chance pour le test d'embauche.");
                        Transport.send(message);
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                //------ fin code ------

            //demande_accExt.insertionDemande_accEx(id_eurExt,pseudo_accex,mdp_accex,accepter,bdd);
    
        try{
            testeInter.insertionTestInt(type, id_eurIn, bdd);
            session.setAttribute("type", type);
            
            //message valider
            request.setAttribute("etat","valider");
            response.sendRedirect("admin/dashbord/table demandeur interne.jsp?etat=1");
            }catch (Exception e) {
                
            //message erreur
            response.sendRedirect("admin/dashbord/table demandeur interne.jsp?etat=0");

            }

                  
        } catch (Exception e) {
          //  message erreur
            response.sendRedirect("admin/dashbord/table demandeur interne.jsp?etat=0");

        }
    }

    @Override
    public void destroy() {
    }

    private void setAttribute(String erreur1) {
        throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
                                                                       // Tools | Templates.
    }
}