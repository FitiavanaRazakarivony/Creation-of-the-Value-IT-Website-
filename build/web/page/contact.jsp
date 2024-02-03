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
    
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Value-IT - Contact</title>
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
  <body>
    

    <section class="ftco-cover overlay" style="background-image: url(../images/bg_2.jpg);" id="section-home" data-aos="fade"  data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center justify-content-center ftco-vh-100">
          <div class="col-md-9 text-center">
            <h1 class="ftco-heading mb-4" data-aos="fade-up" data-aos-delay="500">Contactez nous</h1>
            <h2 class="h5 ftco-subheading mb-5" data-aos="fade-up"  data-aos-delay="600">Aide nous</h2>
          </div>
        </div>
      </div>
    </section>

    <div class="ftco-section contact-section">
      <div class="container bg-light">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-12 mb-4">
            <h2 class="h4">Information Contact</h2>
          </div>
          <div class="w-100"></div>
          <div class="col-md-3">
            <p><span>Address:</span> Enceinte Somalco Zone Forello Tanjombato </p>
          </div>
          <div class="col-md-3">
            <p><span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a></p>
          </div>
          <div class="col-md-3">
            <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a></p>
          </div>
          <div class="col-md-3">
            <p><span>Website</span> <a href="#">Value-IT.com</a></p>
          </div>
        </div>
     <%-- ------------ contact -------- --%>   
     
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
                        <input type="text" id="nom" class="form-control" placeholder="Nom" name="nom">
                     <span id="nom-error" style="display: none; color:red;">Veuillez entrer le nom.</span>
                    </div>
                    <div class="form-group">
                        <input type="text" id="prenom" class="form-control" placeholder="Prenom" name="prenom">
                        <span id="prenom-error" style="display: none; color:red;">Veuillez entrer le prenom.</span>
                    </div>
                    <div class="form-group">
                        <input type="text" id="email" class="form-control" placeholder="Email" name="email">
                        <span id="email-error" style="display: none; color:red;">Veuillez entrer votre l'email !.</span>
                    </div>
                    <div class="form-group">
                        <textarea cols="30" rows="7" id="message" class="form-control" name="mp" placeholder="Message"></textarea>
                        <span id="message-error" style="display: none; color:red;">Veuillez entrer votre message !.</span>
                    </div>
                    <div class="form-group">
                        <input type="submit" onclick="validateForm()" value="Envoyer" class="btn btn-primary">
                    </div>
                  </form>
                </div>
                  <%--map--%>
                  <div class="col-md-6" data-aos="fade-up" id="carteId">
                      
                  </div>
              </div>
            </div>
      </div>        
        <% } else { %>
      <div class="ftco-section">
          <div class="container">
            <div class="row justify-content-center pb-5">
              <div class="col-md-7 text-center"  data-aos="fade-up">
                <h2>Contactez nous</h2>
              </div>
            </div>
            <div class="row block-9" data-aos="fade-up">
              <div class="col-md-6 pr-md-5">
                <form action="../insertionContact_int" method="POST">
                    
                    <%-- prend id_visit --%>
                    
                <% while (relt1.next()) { %>
                  <input type="hidden" name="id" value="<% out.println(relt1.getString("id_visit")); %>">
                <% }%>
            
                <div class="form-group">
                    <textarea cols="30" rows="7" id="messageIn" class="form-control" name="mp" placeholder="Message"></textarea>
                    <span id="messageIn-error" style="display: none; color:red;">Veuillez entrer votre l'email !.</span>
                </div>
                <div class="form-group">
                    <input type="submit" onclick="validate()" value="Envoyer" class="btn btn-primary">
                </div>
                </form>
              </div>
                  <div class="col-md-6" data-aos="fade-up" id="carteId"></div>
            </div>
          </div>
      </div>
        <% } %>
     <%-- ------------ fin contact -------- --%>   

      </div>
    </div>
    
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
  <!-- maps -->
  <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script src="../js/js_maps/maps.js"></script>
  
      <script>
        function validateForm(){
        // si vide nom
        var input = document.getElementById("nom");
        var nomError = document.getElementById("nom-error");
        var value = input.value.trim();

        if (value.length === 0) {
            nomError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             nomError.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
       // prenom
        var input = document.getElementById("prenom");
        var prenomError = document.getElementById("prenom-error");
        var value = input.value.trim();

        if (value.length === 0) {
            prenomError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
            prenomError.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
        // email
        var input = document.getElementById("email");
        var emailError = document.getElementById("email-error");

        var value = input.value.trim();

        if (value.length === 0) {
            emailError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
            emailError.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
        // message
        var input = document.getElementById("message");
        var messageError = document.getElementById("message-error");

        var value = input.value.trim();

        if (value.length === 0) {
            messageError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
            messageError.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
    }
  </script>
    <script>
        function validate(){
        // message
        var input = document.getElementById("messageIn");
        var messageError = document.getElementById("messageIn-error");

        var value = input.value.trim();

        if (value.length === 0) {
            messageError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
            messageError.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
    }
  </script>
            <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            if (message == 1) {
              // Afficher la notification de succès avec Swal.fire()
              Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Valider',
                showConfirmButton: false,
                timer: 1500
              });
            } else if (message == 0) {
              // Afficher la notification d'erreur avec Swal.fire()
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Vérifier bien!'
              });
            }
        </script>
  </body>
</html>