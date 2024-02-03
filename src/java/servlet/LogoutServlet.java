
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LogoutServlet", urlPatterns = { "/Logout" })
public class LogoutServlet extends HttpServlet {

    @Override

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        System.out.println("Session before invalidate: "+ request.getSession(false));
        request.getSession(false).invalidate();
        System.out.println("Session after invalidate: "+ request.getSession(false));
        response.sendRedirect("index.jsp");
        System.out.println("deconnection reussi...");
        out.close();
        
           response.sendRedirect("inscription.jsp");

    }  
        // Redirection vers la page de login
    }

