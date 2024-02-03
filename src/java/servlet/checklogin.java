package servlet;

import java.io.*;
import java.sql.Connection;

import Connexion.Connexion;
import table.visiteur;

import javax.servlet.http.*;
import table.admin;
import table.demande_accExt;

public class checklogin extends HttpServlet {
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

        String email_visit = request.getParameter("pseudo");
        String mdp = request.getParameter("motdepass_visit");

        try {
            if (visiteur.checklogin(email_visit, mdp, bdd)) {

                HttpSession session = request.getSession();

                // Définit la durée maximale de la session en secondes (12 heures)
                int sessionDuration = 12 * 60 * 60;
                session.setMaxInactiveInterval(sessionDuration);

                session.setAttribute("email", email_visit);

                response.sendRedirect("page/recrutement.jsp");

            } else if (admin.checkloginAdmin(email_visit, mdp, bdd)) {

                HttpSession session = request.getSession();

                // Définit la durée maximale de la session en secondes (12 heures)
                int sessionDuration = 24 * 60 * 60;
                session.setMaxInactiveInterval(sessionDuration);

                session.setAttribute("email", email_visit);

                response.sendRedirect("admin/dashbord/");

            } else if (demande_accExt.checklogindemandeuraccEX(email_visit, mdp, bdd)) {

                HttpSession session = request.getSession();

                // Définit la durée maximale de la session en secondes (12 heures)
                int sessionDuration = 24 * 60 * 60;
                session.setMaxInactiveInterval(sessionDuration);

                session.setAttribute("email", email_visit);

                response.sendRedirect("page/recrutement.jsp");

            } else {

                HttpSession session = request.getSession();
              //  session.setAttribute("error", "oui");

                response.sendRedirect("page/login.jsp?etat=0");
            }

        } catch (Exception e) {
            out.println(e);
            e.printStackTrace();
        }

    }

    @Override
    public void destroy() {
    }
}