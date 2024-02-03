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
import table.demandeurInt;
import table.nosmetier;
import table.test;


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
// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertionTest_interneServlet extends HttpServlet {
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
            session.setMaxInactiveInterval(-1); // Définir la durée de vie de la session à -1 (jamais expirée)
            
            String id_test= request.getParameter("id");
            String Recruter = request.getParameter("type");

            //Message de contacter qu'il est en recruter
            
            if(Recruter.equals("Recruter")){
            //--- code ---
            final String USERNAME = "fitiavanarazakarivony00@gmail.com";
            final String PASSWORD = "yhnwxpglndbxyecn";
            
            String sujet = "Félicitation";
            String destinataire = request.getParameter("recipient");
            out.print(destinataire);
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
                message.setText("Recruter");
                Transport.send(message);
                } catch (MessagingException e) {
               //throw new RuntimeException(e);
                }
            if(Recruter.equals("Recruter")){
                try {
                    demande_accInt.insertionDemande_accInt(id_test, Recruter, bdd);
                    demandeurInt.updateTo(Integer.parseInt(id_test),Recruter, bdd);
                    session.setAttribute("Recruter", Recruter);
                    
                    //message valider
                    response.sendRedirect("admin/dashbord/table teste du demandeur interne.jsp?etat=1");
                } catch (Exception ex) {
                    //message erreur
                     response.sendRedirect("admin/dashbord/table teste du demandeur interne.jsp?etat=0");    
                }
            }else{
                try {
                   demande_refInt.insertionDemande_refInt(id_test, bdd);
                    demandeurInt.updateTo(Integer.parseInt(id_test),Recruter, bdd);
                    session.setAttribute("Refuser", Recruter);

                    //message valider
                    request.setAttribute("etat","valider");
                    response.sendRedirect("admin/dashbord/table teste du demandeur interne.jsp?etat=1");                  
                } catch (Exception ex) {
                    //message erreur
                    response.sendRedirect("admin/dashbord/table teste du demandeur interne.jsp?etat=0");                }
                }
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