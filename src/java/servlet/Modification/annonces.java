package servlet.Modification;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import table.annonce;
import table.nosmetier;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class annonces extends HttpServlet {
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

        int id_ann = Integer.parseInt(request.getParameter("id_ann"));   

        String Sai_annonce = request.getParameter("annonce");     
        String id_nosMet = request.getParameter("id_nosMet");    

        String typeAnnonce = request.getParameter("typeAnn");       
        
        try{
            session.setAttribute("erreur", 0);
                try{
                    boolean modificationValide = true; // Par exemple, définir cette variable en fonction de la logique de validation de votre application

                    if (modificationValide) {
                        annonce.modifAnnonce(id_ann, Sai_annonce, typeAnnonce, id_nosMet, bdd);
                        session.setAttribute("succes", "La modification a été acceptée avec succès.");
                        response.sendRedirect("admin/dashbord/annonce.jsp");
                    } else {
                        session.setAttribute("erreur", 1);
                        session.setAttribute("messageErreur", "La modification est invalide. Veuillez vérifier vos données.");
                        response.sendRedirect("admin/dashbord/404_error.html");
                    }
                } catch(Exception e){
                    
                    session.setAttribute("refuser", "ERREUR.");    
                    response.sendRedirect("admin/dashbord/annonce.jsp");


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