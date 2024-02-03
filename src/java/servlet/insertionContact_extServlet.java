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
import table.contact_ext;
import table.nosmetier;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertionContact_extServlet extends HttpServlet {
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
        String mp = request.getParameter("mp");               
        String nom = request.getParameter("nom");       
        String prenom = request.getParameter("prenom");  
        String email = request.getParameter("email");    

        try{
            session.setAttribute("erreur", 0);
            
            contact_ext.insertionContactEx(mp, nom, prenom, email, bdd);
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