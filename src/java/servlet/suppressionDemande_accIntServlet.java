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
import table.demande_accInt;
import table.demande_refInt;
import table.demandeurInt;
import table.nosmetier;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class suppressionDemande_accIntServlet extends HttpServlet {
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
        String id_testeInter = request.getParameter("id");       
    

        try{
            session.setAttribute("erreur", 0);

            demandeurInt.estSupprDemandInt(id_testeInter, bdd);
            demande_accInt.estSupprDemand_accint(id_testeInter, bdd);
            //suppression
            demande_refInt.insertionDemande_refInt(id_testeInter, bdd);

           
            response.sendRedirect("admin/dashbord/table demandeur interne accepter.jsp");
        
        } catch (Exception e) {
            out.println(e);
            e.printStackTrace();
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