package servlet.Modification;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import table.annonce;
import table.demandeurInt;
import table.informSuppl;
import table.nosmetier;
import table.testeInter;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class interne_accept extends HttpServlet {
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
        
         System.out.println(id);
        
        String pseudo = request.getParameter("pseudo");    
        String pass = request.getParameter("mdp_empl");   
         String nom = request.getParameter("nom_empl");    
        String prenom = request.getParameter("prenom_empl");   
         String tel = request.getParameter("tel_empl");    
        String email = request.getParameter("email_empl");  
         String adress = request.getParameter("adress_empl");  
          int idB = Integer.parseInt(request.getParameter("id_nosMet"));  
          
       
        try{
                int i = demandeurInt.getVisiteByTeste(id, bdd);
            try{
                demandeurInt.update(i, pseudo, pass, nom, prenom, tel, email, adress, idB, bdd);
                response.sendRedirect("admin/dashbord/modification/Modification interne accepter.jsp?id="+id+"&etat=1");
            } catch(Exception e){
                response.sendRedirect("admin/dashbord/modification/Modification interne accepter.jsp?id="+id+"&etat=0");
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