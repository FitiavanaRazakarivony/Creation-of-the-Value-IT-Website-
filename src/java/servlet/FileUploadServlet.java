package servlet;

import java.io.*;

import Connexion.Connexion;


import javax.servlet.http.*;
import java.sql.*;
/*
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import table.visiteur;*/
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import table.publication;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class FileUploadServlet extends HttpServlet {
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

        try{
            
            // --------- insertion à la base -----
            PrintWriter out = response.getWriter();
            Connection bdd = Connexion.connect();
            HttpSession session = request.getSession();
            
            String date_pub = request.getParameter("date_pub");
            String info_Pub = request.getParameter("info_Pub");
            String id = request.getParameter("id_titreP");
            
            try{
                session.setAttribute("erreur", 0);
                
                publication.insertionPu(date_pub,info_Pub,id, bdd);
                
                //message valider
                request.setAttribute("etat","valider");
                response.sendRedirect("admin/dashbord/Publication.jsp?etat=1");
                
            } catch (Exception e) {
                response.sendRedirect("admin/dashbord/Publication.jsp?etat=0");
            }
            
            
        } catch (IllegalStateException ex) {
                response.sendRedirect("admin/dashbord/Publication.jsp?etat=0");
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