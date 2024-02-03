package servlet;

import java.io.*;
import java.sql.Connection;

import Connexion.Connexion;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import table.visiteur;

import javax.servlet.http.*;

// import javax.servlet.annotation.*;
// @WebServlet(name = "helloServlet", value = "/hello-servlet")
public class DeconServlet extends HttpServlet {
    private String message;

    @Override
    public void init() {
        message = "Hello World!";
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        //manala an le momba2 azy 
        HttpSession session = request.getSession(false);
        
        if (session != null) {
          session.invalidate();
        }
                  response.sendRedirect("index.jsp");

    }
    

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
       

    }

    @Override
    public void destroy() {
    }
}