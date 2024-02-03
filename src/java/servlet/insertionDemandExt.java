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
import table.annonce;
import table.contact;
import table.demande_demE;
import table.demandeurExt;
import table.nosmetier;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class insertionDemandExt extends HttpServlet {
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

        try {
            PrintWriter out = response.getWriter();
            Connection bdd = Connexion.connect();
            HttpSession session = request.getSession();
            
            // ----------- demandeurExterne ----
            String nom= request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String adress = request.getParameter("adresse");
            String idsexe = request.getParameter("id_sexe");
            String idann = request.getParameter("id_ann");
            String id_objetDemI = request.getParameter("id_demandeI");      
            String id_demE = request.getParameter("id");
            String contenu = request.getParameter("contenu_demI");
            String fiche = request.getParameter("ficheDePoste_demI");
            
            
            Part filePart = request.getPart("file"); // Obtient la partie de fichier de la requête
            
            String header = filePart.getHeader("content-disposition"); // Obtient l'en-tête "content-disposition"
            
            String fileName = null;
            Pattern pattern = Pattern.compile("filename=\"(.+?)\"");
            Matcher matcher = pattern.matcher(header);
            if (matcher.find()) {
                fileName = matcher.group(1);
            }
            
            if (fileName != null && !fileName.isEmpty()) {
                // Chemin d'enregistrement du fichier
                String savePath = "C:\\Users\\BRAYAN\\Documents\\NetBeansProjects\\value-IT\\web\\cv externe\\" + fileName;
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
                
                try{
                    session.setAttribute("erreur", 0);
                    
                    // ----------- ajout demandeurExterne ----
                    try{
                        demande_demE.estinsertDemand_demI(contenu,id_objetDemI, bdd);
                        
                        int idDem = demande_demE.getLast(bdd);
                        demandeurExt.estinsertDemandExt(nom, prenom, tel, email, adress, fileName, Integer.toString(idDem), idann, idsexe, bdd);
                        
                        //sesion valider
                        request.setAttribute("etat","valider");
                        response.sendRedirect("page/recrutement.jsp?etat=1");
                    
                    }catch(Exception e){
                    
                        //sesion erreur
                        response.sendRedirect("page/recrutement.jsp?etat=0");
                    }
                    
                } catch (Exception e) {
                    out.println(e);
                    e.printStackTrace();
                }
            }
        } catch (IllegalStateException ex) {
                        response.sendRedirect("page/404_error.html");
        } catch (ServletException ex) {
            response.sendRedirect("page/404_error.html");
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