package servlet;

import java.io.*;

import Connexion.Connexion;
import javax.servlet.http.*;
import java.sql.*;
import table.employeur;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class RechercheNosMetServlet extends HttpServlet {
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
    
       
       // ----------- MODIFICATION ---- 
        String nom_nosmet = request.getParameter("recherche");       

        try{
            session.setAttribute("erreur", 0);
            
            employeur.getAllnosMetRecher(nom_nosmet, bdd);
            
            response.sendRedirect("index.jsp");
        
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