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
import table.publication;
import table.sousTitre;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")

@WebServlet(name = "FileUploadServlet", urlPatterns = { "/fileuploadservlet" })
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class sousTitreServlet extends HttpServlet {
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
            PrintWriter out=response.getWriter();
            out.println("1");
            Part filePart = request.getPart("file"); // Obtient la partie de fichier de la requête
out.println("2");
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
                System.out.println("3");
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
            out.println("4");
            // --------- insertion à la base -----
            Connection bdd = Connexion.connect();
            HttpSession session = request.getSession();
            
            String ajout = request.getParameter("ajout_soustitre");
            String id = request.getParameter("id");

            out.println("5");
            try{
                session.setAttribute("erreur", 0);
                
                sousTitre.insertionTitre(ajout, id, fileName, bdd);
                
                //message valider
                response.sendRedirect("admin/dashbord/Publication.jsp?etat=1");
                
            } catch (Exception e) {

                //message erreur
                request.setAttribute("etat","valider");
                response.sendRedirect("admin/dashbord/Publication.jsp?etat=0");    
            }
            
        } catch (IllegalStateException ex) {
            //message erreur
            response.sendRedirect("admin/dashbord/Publication.jsp?etat=0");            
            
        } catch (ServletException ex) {
            //message erreur lorsque le taille d'image est plus large
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