<%@ include file="base.jsp" %>
<%@page import="table.titre"%>
<%@ page import="table.employeur" %>
<%@ page import="table.nosmetier" %>
<%@ page import="table.chef" %>


<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String e_mail= (String) session.getAttribute("email");
    Connection bdd = Connexion.connect();
    
    ResultSet relt = employeur.afficher(e_mail,bdd);  
    ResultSet res = nosmetier.getnosMetier(bdd);
    ResultSet AllChef = chef.getAllChef(bdd);
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Value-IT - A propos</title>
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
    
    <section class="ftco-cover overlay" style="background-image: url(../images/bg_3.jpg);" id="section-home" data-aos="fade"  data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center justify-content-center ftco-vh-100">
          <div class="col-md-9 text-center">
            <h1 class="ftco-heading mb-4" data-aos="fade-up" data-aos-delay="500">A propos de nous</h1>
            <h2 class="h5 ftco-subheading mb-5" data-aos="fade-up"  data-aos-delay="600">
            </h2>
          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

    <section class="ftco-section-2">
      <div class="container-fluid">
        <div class="section-2-blocks-wrapper row no-gutters">
          <div class="img col-sm-12 col-md-6" style="background-image: url('../images/image_4.jpg');" data-aos="fade-right">
          </div>
          <div class="text col-md-6">
            <div class="text-inner align-self-start" data-aos="fade-up">
              
              <h3>Value-IT a été initialement un centre de production offshore de Workit Software siégé à Paris. Depuis décembre 2020</h3>
              <p>
                  Value IT est une entreprise innovante qui se
                  spécialise dans la collecte et le traitement des prix online. 
                  Avec des millions de prix relevés plusieurs fois par jour, 
                  un haut niveau de service, des applications SaaS et 
                  la qualité des data, elle permet d'offrir une solution de veille concurrentielle B2B parmi
                  les plus performantes du marché. ValueIT est à la pointe de la technologie et des process : 
                  NoSQL, Big Data, Event-Driven Architecture, Business Activity Monitoring/BI, Agile/Kanban...
              </p>

              <p>
                  L'activité principale de WorkIT Software est la"Veille concurrentielle de prix" plus précisément,
                  en termes de production, collecte des données des sites e-commerces. Ces données sont vendues aux 
                  180 clients en Europe afin que ces derniers puissent prendre des décisions sur les positionnements
                  de leurs produits sur le marché.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

      <%-- ------------ chef -------- --%>     
      <section class="page-section bg-light" id="team">
          <div class="container" id="chef" data-aos="fade-up">

            <div class="row justify-content-center mb-5 pb-5">
                <div class="col-md-7 text-center"  data-aos="fade-up">
                  <h2>Notre chefs d'équipe</h2>
                </div>
            </div>
              <div class="row" data-aos="fade-up" style="margin-top: 71px;">
                <% while (AllChef.next()) { %>

                  <div class="col-lg-4 " style="box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.04);" data-aos="fade-up">
                      <div class="team-member" style="display: flex;flex-direction: column;" >
                          <div class="image" style="margin: auto;">
                            <img class="mx-auto rounded-circle" src="../image/<% out.println(AllChef.getString("imageLead")); %>" alt="image" style="width: 13rem;height: 13rem;"/>
                          </div>
                          <h4 class="my-3"><% out.println(AllChef.getString("nomLead")); %></h4> <span><% out.println(AllChef.getString("prenomLead")); %></span>
                          <p class="text-muted">Lead <% out.println(AllChef.getString("nom_nosMet")); %></p>
                      </div>
                  </div>
                <% }%>
              </div>
              <div class="commentaire">
                  <div class="row">
                      <div class="col-lg-8 mx-auto text-center"><p class="large text-muted" style="margin-top: 74px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
                  </div>
              </div>
          </div>
      </section>
    
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
    
  </body>
</html>