<%@ include file="base.jsp" %>
<%@ page import="table.employeur" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="table.annonce" %>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String e_mail= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet relt1 = employeur.afficher(e_mail,con);  

    ResultSet AllAnonce = annonce.getAllAnnonce(con);
    
    ResultSet getIdAnn = annonce.getIdAnn(request.getParameter("id_ann"),con);   
   
    ResultSet AllAnonceEtNosMet = annonce.getAnnEtNosMetId(request.getParameter("id_ann"),con);
    ResultSet AnonceEtNosMet = annonce.getAnnEtNosMet(con);   
    ResultSet AnonceEtNosMetIntern = annonce.getAnnEtNosMetIntern(con);

%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Value-IT - Recrutement</title>
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
        
    <!-- message css -->    	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

  </head>
  <style>
    .panier{
      margin-top: 4rem ! important;
    }
    .panier:hover{
    box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);   

    }
  </style>
  <body>

    <section class="ftco-cover overlay" style='background-image: url("../images/gasy1.jpg");' id="section-home" data-aos="fade"  data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center justify-content-center ftco-vh-100">
          <div class="col-md-9 text-center">
            <h1 class="ftco-heading mb-4" data-aos="fade-up" data-aos-delay="500">Annonce</h1>
            <h2 class="h5 ftco-subheading mb-5" data-aos="fade-up"  data-aos-delay="600">
                
            </h2>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

    <div class="ftco-section">
      <div class="container">
        <div class="text-center" data-aos="fade-up">
            <% if (email != null){ %>
              <div class="container">
                  <div class="text-center">
                    <h3 class="section-subheading text-muted">Les offres d'emploi pour les demandeurs internes</h3>
                  </div>
              </div>
            <% } %>
              <% if (email == null){ %>
                <h3 class="section-subheading text-muted">Les offres d'emploi pour les demandeurs externes</h3>
                <a class="nav-link" href="login.jsp">postuler</a>
              <% } else { %>
          <div class="row ">

            <% while (AnonceEtNosMetIntern.next()) { %>

                <div class="col-md-6 col-lg-4" data-aos="fade-right">    
                    <div class="panier">
                      <div class="card">
                          <div class="card-header">
                              Rechercher
                          </div>
                          <div class="card-body">
                              <h5 class="card-title"><% out.println(AnonceEtNosMetIntern.getString("nom_nosMet")); %></h5>
                              <p class="card-text"><% out.println(AnonceEtNosMetIntern.getString("annonce")); %></p> 

                              <a class="btn btn-primary  text-uppercase" 
                              href="postuler.jsp?id_ann=<% out.println(AnonceEtNosMetIntern.getString("id_ann")); %>">Voir plus</a>                          </div>
                        </div>
                    </div>         
                </div>    

            <% } %>

          </div>
          <% } %>
        </div>

        <div class="row text-center login" data-aos="fade-up" >
          <% if (email != null){ %>
              <div class="container">
                  <div class="text-center">
                    <h3 class="section-subheading text-muted">Les offres d'emploi pour les demandeurs externes</h3>
                  </div>
              </div>
          <% } %>
          <% while (AnonceEtNosMet.next()) { %>
            <div class="col-md-4">    
              <div class="panier" data-aos="fade-right">
                  <div class="card">
                      <div class="card-header">
                          Rechercher
                      </div>
                      <div class="card-body">
                          <h5 class="card-title"><% out.println(AnonceEtNosMet.getString("nom_nosMet")); %></h5>
                          <p class="card-text"><% out.println(AnonceEtNosMet.getString("annonce")); %></p> 

                          <a class="btn btn-primary  text-uppercase" 
                          href="postuler.jsp?id_ann=<% out.println(AnonceEtNosMet.getString("id_ann")); %>">Voir plus</a>                         
                      </div>
                  </div>
              </div>         
            </div>
          <% } %>
        </div>
      </div>
    </div>

         <%-- ------------ contact -------- --%>   
        <!-- contact interne -->
        <% if (e_mail == null){ %>
            <div class="ftco-section">
                  <div class="container">
                    <div class="row justify-content-center pb-5">
                      <div class="col-md-7 text-center"  data-aos="fade-up">
                        <h2>Contactez nous</h2>
                      </div>
                    </div>
                    <div class="row block-9" data-aos="fade-up">
                      <div class="col-md-6 pr-md-5">
                        <form action="../insertionContact_ext" method="POST">
                          <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nom" name="nom">
                          </div>
                          <div class="form-group">
                            <input type="text" class="form-control" placeholder="Prenom" name="prenom">
                          </div>
                          <div class="form-group">
                            <input type="text" class="form-control" placeholder="Email" name="email">
                          </div>
                          <div class="form-group">
                            <textarea id="" cols="30" rows="7" class="form-control" name="mp" placeholder="Message"></textarea>
                          </div>
                          <div class="form-group">
                            <input type="submit" value="Envoyer" class="btn btn-primary">
                          </div>
                        </form>
                      </div>
                      <div class="col-md-6" data-aos="fade-up" id="carteId"></div>
                    </div>
                  </div>
              </div>        
        <% } else { %>
              <div class="ftco-section">
                  <div class="container">
                    <div class="row justify-content-center pb-5">
                      <div class="col-md-7 text-center" data-aos="fade-up">
                        <h2>Contactez nous</h2>
                      </div>
                    </div>
                    <div class="row block-9" data-aos="fade-up">
                      <div class="col-md-6 pr-md-5">
                        <form action="../insertionContact_int" method="POST">
                            
                    <% while (relt1.next()) { %>
                      <input type="hidden" name="id" value="<% out.println(relt1.getString("id_visit")); %>">

                    <% }%>
                          <div class="form-group">
                            <textarea id="" cols="30" rows="7" class="form-control" name="mp" placeholder="Message"></textarea>
                          </div>
                          <div class="form-group">
                            <input type="submit" value="Envoyer" class="btn btn-primary">
                          </div>
                        </form>
                      </div>
                      <div class="col-md-6" data-aos="fade-up" id="carteId"></div>
                    </div>
                  </div>
              </div>
        <% } %>


        <!-- fin contact intern -->
 
     <%-- ------------ fin contact -------- --%>  

  
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
            <div class="col-md-12 text-center"></div>
        </div>
  </footer>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

        <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            console.log( message + " sfsq")
            if (message == 1) {
                console.log( message + "ss")
              // Afficher la notification de succès avec Swal.fire()
              Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Demande envoyé',
                showConfirmButton: false,
                timer: 1500
              });
            } else if (message == 0) {
              // Afficher la notification d'erreur avec Swal.fire()
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Verifier bien votre demande!'
              });
            }
        </script> 
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
  
<!-- maps -->
  <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script src="../js/js_maps/maps.js"></script>
    
  </body>
</html>