
<%@page import="table.demande_accExt"%>
<%@page import="table.visiteur"%>
<%@page import="table.titre"%>
<%@ page import="table.employeur" %>
<%@ page import="table.nosmetier" %>
<%@ page import="table.chef" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.*" %>

<%
    String e_mail= (String) session.getAttribute("email");    
    Connection bdd = Connexion.connect();
    ResultSet relt1 = employeur.afficher(e_mail,bdd);  
    ResultSet relt = employeur.afficher(e_mail,bdd);    
    ResultSet resul = demande_accExt.afficher(e_mail, bdd);
    ResultSet res = nosmetier.getnosMetier(bdd);
    ResultSet AllChef = chef.getAllChef(bdd);
    ResultSet getALLTitre = titre.getTitreP(bdd);
    
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Value-IT</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/aos.css">  
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
     <!-- message css -->    	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
     
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" data-aos="fade-down" data-aos-delay="500">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">
          <img src="images/logo.png" alt="image" style="width: 10rem;height: 2rem;">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span> Menu
        </button>
        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="index.jsp" class="nav-link">Acceuil</a></li>
            <li class="nav-item"><a href="page/publication.jsp" class="nav-link">Pulication</a></li>
            <li class="nav-item"><a href="page/A propos.jsp" class="nav-link">A propos</a></li>
            <li class="nav-item"><a href="page/recrutement.jsp" class="nav-link">Recrutement</a></li>
            <li class="nav-item"><a href="page/contact.jsp" class="nav-link">Contact</a></li>    
          </ul>
            <div class="row">
            <%-- si le visiter est connecter donc il y a le boutton decon --%>
              <% if (e_mail != null){ %>
              <div>
                <form action="DeconServlet" method="GET" style="margin-right: 0px;margin-left: 39px;margin-top: 5px;">
                    <button type="submit" class="btn btn-danger">Deconnexion <i class="fa fa-sign-out"></i></button>
                </form>
              </div>

              <% } else {%> 
              <a href="page/login.jsp" class="nav-link" style="color: white;">Se Connecter</a>
              <%}%>
              
            <% while (relt.next()) { %>
                <div class="par_btn_activ" style="margin-top: 0rem;padding-right: -5px;padding-left: 7px;">
                    <div class="btn_active"></div>
                    <span class="bln size navbar-brand"><% out.println(relt.getString("pseudo_visit")); %></span> 
                    <span class="bln size navbar-brand"><% out.println(relt.getString("pseudo_accext")); %></span>
                </div
            <% }%> 
            <% while (resul.next()) { %>
                <div class="par_btn_activ" style="margin-top: 0rem;padding-right: -5px;padding-left: 7px;">
                    <div class="btn_active"></div>
                    <span class="bln size navbar-brand"><% out.println(resul.getString("pseudo_accext")); %></span>
                </div>
            <% }%> 
            </div>
        </div>
    </nav>
    <!-- END nav -->
    <section class="ftco-cover overlay" style="background-color: black;" id="section-home" data-aos="fade"  data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center ftco-vh-100">
          <div class="col-md-8 text-center">
            <h1 class="ftco-heading mb-4" data-aos="fade-up" data-aos-delay="500">Bonjour !<br> Bienvenue sur Value-IT</h1>
            
            <%-- visiteur n'actif pas il y a le btn connect--%>

            <% if (e_mail == null){ %>
                <p data-aos="fa
                   de-up"  data-aos-delay="700">
                    <a href="page/login.jsp"  class="btn btn-outline-white px-4 py-3" >Se Conneter</a>
                </p>           
            <%}%>

          </div>
        </div>
      </div>
    </section>
    <!-- END section -->

     <%-- ------------ a propos  -------- --%>
    <section class="ftco-section-2" style="margin-top: 67px;">
      <div class="container-fluid">
        <div class="section-2-blocks-wrapper row no-gutters">
          <div class="img col-sm-12 col-md-6" style="background-image: url('images/image_4.jpg');" data-aos="fade-right">
            <!-- <a href="https://vimeo.com/45830194" class="button popup-vimeo" data-aos="fade-right" data-aos-delay="700"><span class="ion-ios-play"></span></a> -->
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
    <%-- ------------ fin  a propos  -------- --%>

    <%-- ------------  nos metier -------- --%>
    <div class="ftco-section bck_image">
        <div class="container" >
            <div class="row justify-content-center">
                <div class="col-md-7 text-center" data-aos="fade-up">
                    <h2>Nos Metiers</h2>
                </div>
            </div>

            <div class="row nosMetier">
                <%-- prend le metier --%>
                <% while (res.next()) { %>
                <div class="col-md-6 col-lg-4" data-aos="fade-up">
                    <div class="media block-6 d-block text-center">
                        <div class="icon mb-4"><span class="flaticon-gavel"></span></div>
                        <div class="media-body">
                            <h3 class="heading"><% out.println(res.getString("nom_nosMet")); %></h3>
                            <p><% out.println(res.getString("description_nosMet")); %></p>
                        </div>
                    </div> 
                </div>
                <% }%>
            </div>
        </div>
    </div
    
     <%-- ------------fin  nos metier -------- --%>

     <%-- ------------ chef -------- --%>     
      <section class="page-section bg-light" id="team" style='background-image: url("images/2710477.jpg");margin-top: 47px;margin-left: -123px;'>
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
                            <img class="mx-auto rounded-circle" src="image/<% out.println(AllChef.getString("imageLead")); %>" alt="image" style="width: 13rem;height: 13rem;"/>
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
     <%-- ------------ fin chef -------- --%>  

     <%-- ------------ contact -------- --%>   
     
            <%-- id_visit est connecter --%>

        <% if (e_mail == null){ %>
      <div class="ftco-section">
            <div class="container">
              <div class="row justify-content-center mb-5 pb-5">
                <div class="col-md-7 text-center"  data-aos="fade-up">
                  <h2>Contactez nous</h2>
                </div>
              </div>
              <div class="row block-9" data-aos="fade-up">
                <div class="col-md-6 pr-md-5">
                  <form action="insertionContact_ext" method="POST">
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
                  <%--map--%>
                  <div class="col-md-6" data-aos="fade-up" id="carteId">
                      
                  </div>
              </div>
            </div>
      </div>        
        <% } else { %>
            <%-- id_visit ne pas connectï¿½ --%>

      <div class="ftco-section">
          <div class="container">
            <div class="row justify-content-center mb-5 pb-5">
              <div class="col-md-7 text-center"  data-aos="fade-up">
                <h2>Contactez nous</h2>
              </div>
            </div>
            <div class="row block-9" data-aos="fade-up">
              <div class="col-md-6 pr-md-5">
                <form action="insertionContact_int" method="POST">
                    
                    <%-- prend id_visit --%>
                    
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
     <%-- ------------ fin contact -------- --%>     
     <%-- ------------ pieds de page -------- --%>     
  
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
            <h2 class="ftco-heading-2">Communautï¿½s</h2>
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


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/main.js"></script>
<!-- maps -->
  <script type="text/javascript"src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script src="js/js_maps/maps.js"></script>
  
<script type="text/javascript"
src="https://maps.googleapis.com/maps/api/js?sensor=false">
</script>
<script type="text/javascript">
    function initialize() {
    var mapOptions = {
    center: new google.maps.LatLng(-18.955977780739268, 47.51789953701953),
    zoom: 20,
    mapTypeId:google.maps.MapTypeId.SATELLITE

    };
    var carte = new google.maps.Map(document.getElementById("carteId"),
    mapOptions);
    var location = new google.maps.LatLng(-18.955977780739268, 47.51789953701953);
    var marker = new google.maps.Marker({
    position: location,
    draggable: true, 
    map: carte
    });
    }
    google.maps.event.addDomListener(window, 'load', initialize);

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