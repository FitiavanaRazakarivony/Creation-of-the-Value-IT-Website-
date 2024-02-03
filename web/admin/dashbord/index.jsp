
<%@page import="table.testeInter"%>
<%@page import="table.test"%>
<%@page import="table.demande_demE"%>
<%@page import="table.demande_demI"%>
<%@page import="table.nosmetier"%>
<%@page import="table.sexe"%>
<%@page import="table.sousTitre"%> 
<%@page import="table.demandeurExt"%> 
<%@page import="table.demandeurInt"%> 
<%@ page import="table.employeur" %>
<%@ page import="table.visiteur" %>
<%@page import="table.admin"%>
<%@ page import="java.util.Date" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>
<%@page import="table.demande_accExt"%>
<%@page import="table.demande_accInt"%>
<%@page import="table.demande_refEx"%>
<%@page import="table.demande_refInt"%>

<%
    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    ResultSet getcompteVis = visiteur.compteVisiteur(con);   
    
//compte demandeur interne   
    ResultSet getcompteDemIn= demandeurInt.getCompDemIn(con);   

    //compte demandeur externe
    ResultSet getcompteDemEx= demandeurExt.getCompDemEx(con); 
    
    //compte demandeur accepeter apres la test externe
    ResultSet getcompteAccEx= demande_accExt.getDemandeAcc(con);   
        
    //compte demandeur accepeter apres la test interne
    ResultSet getcompteAccInt= demande_accInt.getDemandeAcc(con); 
            
    //compte demandeur supprimet Externe
    ResultSet getcompteSuppEx= demande_refEx.getDemandeSuppr(con); 
              
    //compte demandeur supprimet interne
    ResultSet getcompteSuppIn= demande_refInt.getDemandeSuppr(con);   

%>

<!DOCTYPE html>
<html lang="en">
    <head>
     <!-- basic -->
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">

     <!-- site metas -->
     <title>Value-IT - Admin</title>
     <meta name="keywords" content="">
     <meta name="description" content="">
     <meta name="author" content="">
     <link rel="stylesheet" href="css/bootstrap.min.css" />
     <!-- site css -->
     <link rel="stylesheet" href="style.css" />
     <!-- responsive css -->
     <link rel="stylesheet" href="css/responsive.css" />
     <!-- font-awesome -->
     <link rel="stylesheet" href="../dashbord/css/font-awesome.min.css">
     <!-- statistique -->
     <link rel="stylesheet" href="../../css/aos.css">
     <link rel="stylesheet" href="../../css/flaticon.css">
     <!-- message css -->    	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
        
 </head>
 <style>

</style>
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="../../index.jsp">
                        </a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <% while (V_res.next()) { %> 
                           <div class="user_img">
                              <a href="../../index.jsp">
                              <img class="img-responsive" src="../../image/<% out.println(V_res.getString("image_admin")); %>" alt="image" />
                              </a>
                              </div>
                              <div class="user_info">
                                 <h6> <% out.println(V_res.getString("type_admin")); %></h6>
                                 <p><span class="online_animation"></span>Online</p>
                              </div>
                           </div>
                           <%}%>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>General</h4>
                   <ul class="list-unstyled components">
                     <li><a href="dashboard.jsp"><i class="fa fa-dashboard yellow_color"></i> <span>Dashboard</span></a></li>

                     <li><a href="Les travailleurs.jsp"><i class="fa fa-laptop orange_color"></i> <span>Les travailleurs</span></a></li>
                     <li>
                        <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cart-plus purple_color2"></i> <span>Ajouts elements</span></a>
                        <ul class="collapse list-unstyled" id="element">
                           <li><a href="Publication.jsp">> <span>Publication</span></a></li>
                           <li><a href="les Chefs.jsp">> <span>Chef</span></a></li>
                           <li><a href="annonce.jsp">> <span>annonce</span></a></li>
                           <li><a href="Travailleur.jsp">> <span>Travailleur</span></a></li>
                        </ul>
                     </li> 

                     <li class="active">
                        <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-briefcase yellow_color"></i> <span> Liste des demandes</span></a>
                        <ul class="collapse list-unstyled" id="additional_page">
 
                            <% while (getcompteDemEx.next()) {  %> 
                            <li>
                                <a href="table demandeur externe.jsp">> <span>Liste demandeurs externes </span> <a href="../#"><span class="badge"><% out.println(getcompteDemEx.getString("compteE")); %></span></a>
                            </li>
                            <% } %> 
                            <% while (getcompteDemIn.next()) { %>
                                <li>
                                    <a href="table demandeur interne.jsp">> <span>Liste demandeurs internes </span><span class="badge"><% out.print(getcompteDemIn.getString("compteI")); %></span> </a>
                                </li>
                            <% } %>
                                                       
                        </ul>
                     </li>
                     
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../images/agreement.png" alt="#" />Demandeur en teste
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin" aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table teste du demandeur externe.jsp">>> <span> Les externes</span></a>
                        </li>
                        <li>
                            <a href="table teste du demandeur interne.jsp">>> <span> Les internes</span></a>
                        </li>
                      </ul>
                    </li>
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../images/agreement.png" alt="#" />Demandeur accepter
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <% while (getcompteAccEx.next()) {  %> 
                        <li>
                            <a href="table demandeur externe accepter.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span> <span class="badge"><% out.println(getcompteAccEx.getString("compteDext")); %></span></a>
                        </li>
                        <% }  %>  
                        <% while (getcompteAccInt.next()) {  %> 
                        <li>
                           <a href="table demandeur interne accepter.jsp">
                           <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span> <span class="badge"><% out.println(getcompteAccInt.getString("compteDint")); %></span></a>
                        </li>
                        <% }  %>  
                      </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <img style="width: 27px;" class="img-responsive rounded-circle" src="../../images/delete-folder.png" alt="#" />Demandeur supprimer
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table demandeur externe refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span></a>
                        </li>
                        <li>
                            <a href="table demandeur interne refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span></a>
                        </li>
                      </ul>
                    </li>
                    
                    <li>
                        <a href="contact.jsp">
                        <i class="fa fa-phone red_color"></i> <span>Contact</span></a>
                    </li>
                    
                  </ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                  <nav class="navbar navbar-expand-lg navbar-light">
                     <div class="full">
                        <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                        <div class="logo_section">
                            <a href="../../index.jsp">
                            </a>
                        </div>
                        <div class="right_topbar">
                           <div class="icon_info">
                              <ul class="user_profile_dd">
                                 <li>
                                    <% while (V_res1.next()) { %>
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                       <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                          <%}%>                                   
                                       <div class="dropdown-menu">
                                       
                                       <% if (email_admin != null){ %>
                                          <form action="../../DeconServlet" method="GET">
                                             <a class="dropdown-item" href="#">
                                                <button type="submit" class="btn btn-danger">
                                                   <span>Deconnexion</span> <i class="fa fa-sign-out"></i>
                                                </button>
                                             </a>
                                          </form>
                                    <% } %>
                                 </li>
                              </ul>
                           </div>
                        </div>
                     </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>Dashboard</h2>
                           </div>
                        </div>
                     </div>

                     <!--  Stat -->
                          <%-- ------------  statistique -------- --%>
                        <div class="row column1 social_media_section ftco-section ftco-counter" id="section-counter" style="height: 9rem;">
                           <!-- Les travailleurs -->
                           <div class="col-md-6 col-lg-3">
                              <a href="Les travailleurs.jsp">
                                 <div class="full socile_icons fb margin_bottom_30">
                                    <div class="social_icon">
                                       <span class="flaticon-lawyer"></span> 
                                    </div>
                                    <div class="social_cont">
                                       <ul>
                                          <li>
                                             <div class="text">
                                             <% while (getcompteVis.next()) { %>
                                                <strong class="number" data-number="<% out.println(getcompteVis.getString("compte")); %>">0</strong>
                                             <%}%>
                                                <span>Les travailleurs</span>
                                             </div>
                                          </li>
                                       </ul>
                                    </div>
                                 </div>
                              </a>
                           </div>
                           
                           
                           <%-- ------------ Chart -------- --%>
       
                            <div class="col-lg-9 ">
                                <div class="full socile_icons fb margin_bottom_30">
                                    <div class="full graph_head">
                                        <div class="heading1 margin_0">
                                            <h2>Graphique demandeurs internes et externes par mois</h2>
                                        </div>
                                    </div>
                                    <div class="chart-container">
                                        <div class="filter-container">
                                            <label for="monthFilter">Filtrer par mois:</label>
                                            <select class="bg-select" id="monthFilter" onchange="filterChartByMonth()">
                                                <option value="0">Tous les mois</option>
                                                <option value="1">Janvier</option>
                                                <option value="2">Février</option>
                                                <option value="3">Mars</option>
                                                <option value="4">Avril</option>
                                                <option value="5">Mai</option>
                                                <option value="6">Juin</option>
                                                <option value="7">Juillet</option>
                                                <option value="8">Août</option>
                                                <option value="9">Septembre</option>
                                                <option value="10">Octobre</option>
                                                <option value="11">Novembre</option>
                                                <option value="12">Décembre</option>
                                            </select>
                                        </div>
                                        <canvas id="myChart"></canvas>
                                    </div>
                                </div>
                            </div>
                           
                        <%-- ------------ fin statistique -------- --%>
                        </div>
                    </div>            
                </div>
            </div>
        </div>
                        <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            if (message == 1) {
              // Afficher la notification de succès avec Swal.fire()
              Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
              });
            } else if (message == 0) {
              // Afficher la notification d'erreur avec Swal.fire()
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!'
              });
            }
        </script>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script>
               var ps = new PerfectScrollbar('#sidebar');
            </script>
            <!-- custom js -->
            <script src="js/chart_custom_style1.js"></script>
            <script src="js/custom.js"></script>
            <script src="../../js/jquery.min.js"></script>
            <script src="../../js/jquery-migrate-3.0.1.min.js"></script>
            <script src="../../js/jquery.waypoints.min.js"></script>
            <script src="../../js/jquery.stellar.min.js"></script>
            <script src="../../js/owl.carousel.min.js"></script>
            <script src="../../js/aos.js"></script>
            <script src="../../js/jquery.animateNumber.min.js"></script>
            <script src="../../js/main.js"></script>  
            <script src="../../js/chart.js"></script>  
            <script src="../../admin/dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>

          <%-- ------------ chart demandeur interne par moi -------- --%>

          <script>
        var dataInterne = <%= java.util.Arrays.toString(demande_demI.getSumValuesForAllMonths(con)) %>; // Convertir le tableau Java en tableau JavaScript
        var dataExterne = <%= java.util.Arrays.toString(demande_demE.getSumValuesForAllMonths(con)) %>; // Convertir le tableau Java en tableau JavaScript

        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
                datasets: [{
                    label: 'Données Externes',
                    backgroundColor: 'rgba(255, 99, 132, 0.5)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
                    data: dataExterne
                },
                {
                    label: 'Données Internes',
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                    data: dataInterne
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        function filterChartByMonth() {
            var monthFilter = document.getElementById('monthFilter').value;
            var filteredDataInterne = [];
            var filteredDataExterne = [];

            if (monthFilter === '0') {
                filteredDataInterne = dataInterne;
                filteredDataExterne = dataExterne;
            } else {
                filteredDataInterne.push(dataInterne[parseInt(monthFilter) - 1]);
                filteredDataExterne.push(dataExterne[parseInt(monthFilter) - 1]);
            }

            myChart.data.datasets[0].data = filteredDataExterne;
            myChart.data.datasets[1].data = filteredDataInterne;
            myChart.update();
        }
    </script>
             
        
   </body>
</html>