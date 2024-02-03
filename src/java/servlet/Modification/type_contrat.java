
package servlet.Modification;

import java.io.*;

import Connexion.Connexion;

import javax.servlet.http.*;
import java.sql.*;


import table.sexe;
import table.typeContrat;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class type_contrat extends HttpServlet {
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

        int id_typeCon = Integer.parseInt(request.getParameter("id_typeCon"));   

        String typeCont = request.getParameter("ajout_typeCont");

        try{
            session.setAttribute("erreur", 0);
            
            typeContrat.modifTypeContrat(id_typeCon, typeCont, bdd);
            
            response.sendRedirect("admin/dashbord/annonce.jsp");
        
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
