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
import table.testeInter;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class interne_accepter extends HttpServlet {
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

        
        String id_eurInt = request.getParameter("id_eurInt");    
        String testeInt = request.getParameter("sal");       
        
        try{
            session.setAttribute("erreur", 0);
            
            try{
                testeInter.modifDemIntAccp(id, testeInt, id_eurInt, bdd);
                response.sendRedirect("admin/dashbord/annonce.jsp");
            } catch(Exception e){
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