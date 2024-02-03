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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import table.admin;
import table.employeur;


// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class insertionTrav extends HttpServlet {
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
            HttpSession session = request.getSession();

            
         try{
             
             
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
                 String savePath = "C:\\Users\\BRAYAN\\Documents\\NetBeansProjects\\Value-IT\\web\\image\\" + fileName;
                 
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
             
             String nom = request.getParameter("nom_empl");
             String prenom = request.getParameter("prenom_empl");
             String tel = request.getParameter("tel_empl");
             String mdp = request.getParameter("mdp_empl");
             String email_visit = request.getParameter("email_empl");
             String adress = request.getParameter("adress_empl");
             String id = request.getParameter("id_sexe");
             String id_nosMet = request.getParameter("id_nosMet");
             String type = request.getParameter("type");  
             String pseudo = request.getParameter("pseudo");      


             try{
                 if(type.equals("Admin")){
                    try{
                     admin.insertionVersAdmin(nom, prenom, mdp, email_visit, type, fileName, pseudo, bdd);
                     
                     //message valider
                     request.setAttribute("etat","valider");
                     response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=1");
                     session.setAttribute("email", email_visit);
                    }catch (ServletException ex) {
                    //message erreur
                     response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=0");
                                        
                    }        
                     
                 }else{
                     try{
                        employeur.estinsertVisit(nom, prenom, tel, email_visit, mdp,adress,type,pseudo,fileName,id_nosMet,id, bdd);
                        //message valider
                        response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=1");      
                     }
                     catch (Exception e) {
                        //message erreur
                        response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=0");      
                                      
                    } 
                }
                 
             } catch (Exception e) {
                //message erreur
                response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=0");      
             }            
             
         } catch (IllegalStateException ex) {
            //message erreur
            response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=0");      
        } catch (ServletException ex) {
            //message erreur
            response.sendRedirect("admin/dashbord/Les travailleurs.jsp?etat=0");      

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