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
import table.demande_refEx;
// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertionRetourDemande_refaccExServlet extends HttpServlet {
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
            
            String id = request.getParameter("id");    
            String psd = request.getParameter("Pseudo");  
            String mdp = request.getParameter("mdp");


            String Recruter = "Recruter";
                        //out.println(Recruter);            

            //Message par email
            
            
                if(Recruter.equals("Recruter")){
                //--- code ---
                final String USERNAME = "fitiavanarazakarivony00@gmail.com";
                final String PASSWORD = "yhnwxpglndbxyecn";

                String sujet = "Félicitation";
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
                    message.setText("Recruter");
                    Transport.send(message);
                    } catch (MessagingException e) {
                    throw new RuntimeException(e);
                    }

                    session.setAttribute("erreur", 0); 
                try {
                    demande_accExt.insertionDemande_accEx(id, psd, mdp, Recruter, bdd);
                } catch (Exception ex) {
                    Logger.getLogger(insertionRetourDemande_refaccExServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                try {
                    // demande_accExt.updateTo(Integer.parseInt(id), psd, mdp, bdd);
                    
                    demande_refEx.estSupprDemand_RefExt(id, bdd);
                    //message valider
                    request.setAttribute("etat","valider");
                    response.sendRedirect("admin/dashbord/table demandeur externe refuser.jsp?etat=1");

                } catch (Exception ex) {
                    //message erreur
                    response.sendRedirect("admin/dashbord/table demandeur externe refuser.jsp?etat=0");

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