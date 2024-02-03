package servlet;

import java.io.*;
import Connexion.Connexion;
import javax.servlet.http.*;
import java.sql.*;
import table.demande_accExt;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
import table.test;

public class insertionTest_externeServlet extends HttpServlet {
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

       
        String id_teste = request.getParameter("id");         
        String pseudo_accex = request.getParameter("pseudo_accex"); 
        String mdp_accex = request.getParameter("mdp_accex");  
        String Recruter = "Recruter"; 
                

        //---fin  code ---
         try{             
            
           //Message par email 

            //--- code ---
            final String USERNAME = "fitiavanarazakarivony00@gmail.com";
            final String PASSWORD = "yhnwxpglndbxyecn";         

            String sujet = "Votre compte ";     
            String pseudo = request.getParameter("pseudo_accex");   
            String mdp = request.getParameter("mdp_accex");    

            String destinataire = request.getParameter("recipient");
            out.println(destinataire);
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
                
                message.setText("votre pseudo : "+pseudo+" et ton mot de passe est :"+mdp+"");
                Transport.send(message);
                
                out.println("gdgsdfg");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            session.setAttribute("erreur", 0);     
        
            try {

                demande_accExt.insertionDemande_accEx(id_teste,pseudo_accex,mdp_accex,Recruter,bdd); 
                test.updateTo(Integer.parseInt(id_teste),Recruter, bdd);
                //message valider
                request.setAttribute("etat","valider");
               response.sendRedirect("admin/dashbord/table teste du demandeur externe.jsp?etat=1");


                } catch (Exception ex) {
                    //message erreur
                   response.sendRedirect("admin/dashbord/table teste du demandeur externe.jsp?etat=0");
                }
             }catch (Exception e) {
                    //message erreur
                    response.sendRedirect("admin/dashbord/table teste du demandeur externe.jsp?etat=0");
               
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