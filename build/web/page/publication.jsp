<%@ include file="base.jsp" %>

<%@page import="table.titre"%>
<%@page import="table.sousTitre"%>
<%@page import="table.publication"%>


<%@ page import="table.employeur" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    Connection con = Connexion.connect();

    ResultSet getTitre = titre.getTitre(con);

    ResultSet getPub = publication.getPub(con);



%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Value-IT - Publication</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500" rel="stylesheet">
    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
    

    <section class="ftco-cover overlay" style="background-image: url(../images/image_8.jpg);" id="section-home" data-aos="fade"  data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center justify-content-center ftco-vh-100">
          <div class="col-md-9 text-center">
            <h1 class="ftco-heading mb-4" data-aos="fade-up" data-aos-delay="500">Publication</h1>
            <h2 class="h5 ftco-subheading mb-5" data-aos="fade-up"  data-aos-delay="600">
            </h2>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

    <div class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <p>
              <img src="images/image_10.jpg" alt="" class="img-fluid">
            </p>
              <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <h5>Titre de la Publication</h5>
                <% while (getTitre.next()) { 
                    ResultSet getsousTitre = sousTitre.getsous_Titre(getTitre.getString("id_tittrePub"), con);
                %>
                <!-- <a href="#REBOI" class=""> -->
                    <h2><% out.println(getTitre.getString("titre_pub")); %></h2>  
                
                <% while (getsousTitre.next()) { %>
                <!-- <h3><% out.println(getsousTitre.getString("soustitre_pub")); %></h3>
                <img src="../image/<% out.println(getsousTitre.getString("image")); %>" class="card-img-top" alt="image"> -->
                    
                
                <!-- <% while (getPub.next()) { 
                 ResultSet titre = publication.getIdPub(getPub.getString("id_tittrePub"), con);
                %>
                <% while (titre.next()) {
                 ResultSet titreP = sousTitre.getsous_Titre(titre.getString("id_tittrePub"), con);%>
                   <% while (titreP.next()) { %>
                   <p><% out.println(getPub.getString("info_pub")); %></p>
                    <% }%>
                    <% }%>
                <% }%> -->
                
                <div class="card" style="width: 18rem;">
                  <img src="../image/<% out.println(getsousTitre.getString("image")); %>" class="card-img-top" alt="...">
                    <div class="card-body">
                    <%-- <h5 class="card-title"><% out.println(getTitre.getString("titre_pub")); %></h5> --%>
                    <p class="card-text">
                      <% out.println(getsousTitre.getString("soustitre_pub")); %> </p>
                    </div>
                </div>
                <% }%>
                <% }%>
              </div>
            </div>
            </div>

          </div> <!-- .col-md-8 -->
  

        </div>
      </div>
    </div> <!-- .section -->
  
    <footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md">
          <div class="ftco-footer-widget mb-4">
            <h2 class="ftco-heading-2">A propos Value-IT</h2>
            <ul class="list-unstyled">
                <li><a href="../page/A propos.jsp" class="py-2 d-block">A propos</a></li>
                <li><a href="admin/dashbord/Publication.jsp" class="py-2 d-block">Publications</a></li>
                <li><a href="../page/contact.jsp" class="py-2 d-block">Contact</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md">
           <div class="ftco-footer-widget mb-4">
            <h2 class="ftco-heading-2">Communautes</h2>
            <ul class="list-unstyled">
                <li><a href="../page/recrutemnt.jsp" class="py-2 d-block">Recrutement</a></li>
            </ul>
          </div>
        </div>
      </div>
        <div class="row">
          <div class="col-md-12 text-center">
        </div>
    </div>
  </footer>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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
  <script src="../admin/dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>

    
  </body>
</html>