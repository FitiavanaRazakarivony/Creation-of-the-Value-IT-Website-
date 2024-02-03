package servlet;

import java.io.*;

import Connexion.Connexion;

import javax.servlet.http.*;
import java.sql.*;


import table.sexe;
import table.typeContrat;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertionTypeConServlet extends HttpServlet {
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

   
        String typeCont = request.getParameter("ajout_typeCont");

        try{
            session.setAttribute("erreur", 0);
            
            typeContrat.insertionTypeContrat(typeCont, bdd);
            
            //message valider
            request.setAttribute("etat","valider");
            response.sendRedirect("admin/dashbord/annonce.jsp?etat=1");
        
        } catch (Exception e) {
            //message valider
            response.sendRedirect("admin/dashbord/annonce.jsp?etat=0");        }
    }

    @Override
    public void destroy() {
    }

    private void setAttribute(String erreur1) {
        throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
                                                                       // Tools | Templates.
    }
}