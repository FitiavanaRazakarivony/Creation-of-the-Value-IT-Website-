package servlet;

import java.io.*;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import table.chef;
import table.publication;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class insertionChefServlet extends HttpServlet {
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
            
            /* upload fichier // // */
            /*  Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
            part.write("C:\\Users\\Workdev\\Documents\\NetBeansProjects\\si\\web\\image\\" + fileName);
            }
            */
            Part filePart = request.getPart("file"); // Obtient la partie de fichier de la requête

            String header = filePart.getHeader("content-disposition"); // Obtient l'en-tête "content-disposition"
            
            String fileName = null;
            Pattern pattern = Pattern.compile("filename=\"(.+?)\"");
            Matcher matcher = pattern.matcher(header);
            if (matcher.find()) {
                fileName = matcher.group(1);
            }
            
//-----------
            if (fileName != null && !fileName.isEmpty()) {
                // Chemin d'enregistrement du fichier
                String savePath = "C:\\Users\\BRAYAN\\Documents\\NetBeansProjects\\andrana\\web\\image\\" + fileName;
                
                try {
                    InputStream inputStream = null;
                    OutputStream outputStream = null;
                    try {
                        inputStream = filePart.getInputStream();
                        outputStream = new FileOutputStream(savePath);
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outputStream.write(buffer, 0, bytesRead);
                        }
                    } finally {
                        if (outputStream != null) {
                            outputStream.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                        }
                    }
                } catch (Exception e) {
                    // Gestion des exceptions
                }
            }
            // --------- insertion à la base -----
            PrintWriter out = response.getWriter();
            Connection bdd = Connexion.connect();
            HttpSession session = request.getSession();
            
            String id_nosMet = request.getParameter("id");
            String nom = request.getParameter("nomChef");
            String prenom = request.getParameter("prenomChef");
            
            try{
                session.setAttribute("erreur", 0);

                try{
                    chef.insertionChef(fileName, nom, prenom,id_nosMet,bdd);
                                      
                 //   int etat = 1;
                     //sesion valider
                //    request.setAttribute("etat","valider");
                    response.sendRedirect("admin/dashbord/les Chefs.jsp?etat=1");

                } catch(Exception e){
                    
                     //sesion erreur
                    response.sendRedirect("admin/dashbord/les Chefs.jsp?etat=0");
                }
                
            } catch (Exception e) {
                out.println(e);
            }
            
            
        } catch (IllegalStateException ex) {
            response.sendRedirect("admin/dashbord/404_error.html");
        } catch (ServletException ex) {
            response.sendRedirect("admin/dashbord/404_error.html");
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