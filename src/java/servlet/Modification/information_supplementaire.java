package servlet.Modification;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import table.annonce;
import table.informSuppl;
import table.nosmetier;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class information_supplementaire extends HttpServlet {
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
        
        int id = Integer.parseInt(request.getParameter("id"));   

        
        String id_nosMet = request.getParameter("id_nosMet");    
        String sal = request.getParameter("sal");       
        String horTav = request.getParameter("horairTrav");       
        String id_typC = request.getParameter("id_typeContrat");    

        try{
            session.setAttribute("erreur", 0);
            
            try{
                informSuppl.modifInform(id, id_nosMet,sal, horTav, id_typC, bdd);
                response.sendRedirect("admin/dashbord/annonce.jsp");
            } catch(Exception e){
                response.sendRedirect("admin/dashbord/404_error.html");
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