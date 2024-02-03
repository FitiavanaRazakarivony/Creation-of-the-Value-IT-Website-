package servlet;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;
import javax.servlet.http.*;
import java.sql.*;

public class insertionContact extends HttpServlet {
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
  
       // ------- INSERTION -----
        String messages = request.getParameter("contact");       
        int id_visit = Integer.parseInt(request.getParameter("id"));  
        
       // ----------- MODIFICATION ---- 
        String nom_visit = request.getParameter("nom");       
        String prenom_visit = request.getParameter("prenom_visit");  
        String tel_visit = request.getParameter("tel");    
        String email_visit = request.getParameter("email");    

        try{
            session.setAttribute("erreur", 0);
            
            visiteur.insertionContact(messages,id,bdd);
            
            visiteur.modifVisit(id_visit, nom_visit, prenom_visit, tel_visit, email_visit, bdd);
            
            //message valider
            request.setAttribute("etat","valider");
            response.sendRedirect("index.jsp?etat=1");
        
        } catch (Exception e) {

            //message erreur
            response.sendRedirect("index.jsp?etat=0");
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