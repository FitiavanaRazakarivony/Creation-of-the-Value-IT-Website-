package servlet;

import java.io.*;

import Connexion.Connexion;

import javax.servlet.http.*;
import java.sql.*;


import table.sexe;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class insertSexServlet extends HttpServlet {
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

   
        String Sexe = request.getParameter("ajout_sexe");

        try{
            session.setAttribute("erreur", 0);
                    
            try{
                sexe.insertionSexe(Sexe, bdd);
                //message valider
                request.setAttribute("etat","valider");
                response.sendRedirect("admin/dashbord/Employeur.jsp?etat=1");
            } catch(Exception e){
                response.sendRedirect("admin/dashbord/Employeur.jsp?etat=0");
            }

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