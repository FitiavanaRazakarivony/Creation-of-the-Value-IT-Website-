
<%@page import="table.demande_accExt"%>
<%@ page import="table.employeur" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email= (String) session.getAttribute("email"); 
    Connection conn = Connexion.connect();
    
    ResultSet reult = employeur.afficher(email,conn);  
    ResultSet resul = demande_accExt.afficher(email, conn);

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Value-IT</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/aos.css">    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>            
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" data-aos="fade-down" data-aos-delay="500">
      <div class="container">
        <a class="navbar-brand" href="../index.jsp"> 
          <img src="../images/logo.png" alt="image" style="width: 10rem;height: 2rem;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>

        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="../index.jsp" class="nav-link">Accueil</a></li>
            <li class="nav-item"><a href="publication.jsp" class="nav-link">Publication</a></li>
            <li class="nav-item"><a href="A propos.jsp" class="nav-link">A propos</a></li>
            <li class="nav-item"><a href="recrutement.jsp" class="nav-link">Recrutement</a></li>
            <li class="nav-item"><a href="contact.jsp" class="nav-link">Contact</a></li>    
          </ul>
          <div class="row">
            <% if (email != null){ %>
            <div>
              <form action="../DeconServlet" method="GET" style="margin-right: 0px;margin-left: 39px;margin-top: 5px;">
                  <button type="submit" class="btn btn-danger">Deconnexion <i class="fa fa-sign-out"></i></button>
              </form>
            </div>
            <% } else {%> 
            <a href="login.jsp" class="nav-link" style="color: white;">Se Connecter</a>
            <%}%>
          <% while (reult.next()) { %>
              <div class="par_btn_activ" style="margin-top: 0rem;padding-right: -5px;padding-left: 7px;">
                  <div class="btn_active"></div>
                  <span class="bln size navbar-brand"><% out.println(reult.getString("pseudo_visit")); %></span> 
              </div>
          <% }%> 
            <% while (resul.next()) { %>
                <div class="par_btn_activ" style="margin-top: 0rem;padding-right: -5px;padding-left: 7px;">
                    <div class="btn_active"></div>
                    <span class="bln size navbar-brand"><% out.println(resul.getString("pseudo_accext")); %></span>
                </div
            <% }%> 
          </div>
        </div>
      </div>
    </nav>

    
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>