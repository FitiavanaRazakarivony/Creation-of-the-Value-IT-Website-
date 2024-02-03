package servlet;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import table.annonce;
import table.nosmetier;
import table.titre;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class titrePubServlet extends HttpServlet {
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
        
        String stitre = request.getParameter("ajout_titre");   

        try{
            try{
                    session.setAttribute("erreur", 0);

                    titre.insertionTitre(stitre, bdd);
                    //messsage valider
                    request.setAttribute("etat","valider");
                    response.sendRedirect("admin/dashbord/Publication.jsp?etat=1");
                } catch(Exception e){

                    //messsage erreur
                    response.sendRedirect("admin/dashbord/Publication.jsp?etat=0"); 
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