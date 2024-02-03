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
import table.demande_refEx;
import table.demande_refInt;
import table.demandeurExt;
import table.demandeurInt;
import table.nosmetier;
import table.test;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class suppressionExtAccpter extends HttpServlet {
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
        String id_eurExt = request.getParameter("id"); 
        String id = request.getParameter("id_eurex");       
     

        try{
            session.setAttribute("erreur", 0);
            
            demande_refEx.insertionDemande_refext(id_eurExt, bdd); 
            
          /*  demandeurExt.estSupprDemandEx(id, bdd);
            test.estSupprTest(id_eurExt, bdd); */

            //demandeurExt.estSupprDemandEx(id_eurExt, bdd);
            
            demande_accExt.estSupprDemand_accExt(id_eurExt, bdd);
            //suppression

            //message valider
            request.setAttribute("etat","valider");
            response.sendRedirect("admin/dashbord/table demandeur externe accepter.jsp?etat=1");
        
        } catch (Exception e) {
            
            //message erreur
            response.sendRedirect("admin/dashbord/table demandeur externe accepter.jsp?etat=0");
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