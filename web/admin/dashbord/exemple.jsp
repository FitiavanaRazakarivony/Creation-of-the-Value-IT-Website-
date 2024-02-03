
<%@page import="table.demandeurInt"%>
<%@page import="table.demande_demE"%>
<%@page import="table.demande_demI"%>
<%@ page import="table.test"%>
<%@ page import="table.teste"%>
<%@ page import="table.demande_accExt"%>
<%@ page import="table.admin"%>
<%@ page import="table.demandeurExt" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>


<%
   String email_admin= (String) session.getAttribute("email");
   Connection con = Connexion.connect();
   ResultSet V_res = admin.afficherAdmin(email_admin, con);
   ResultSet V_res1 = admin.afficherAdmin(email_admin, con);
    String type= (String) session.getAttribute("type"); 
   
   ResultSet AllEmpl = demandeurExt.getDemandeurExterne(con);     
   ResultSet AllEmplteste = demandeurExt.getDemandeurExterneTeste(con);   

   ResultSet AllTeste = demandeurExt.getDemandeurExterne(con);   
   ResultSet AllDem_accEx = demande_accExt.afficherDeman_accEx(con); 

   ResultSet getcompteDemIn = demandeurInt.getCompDemIn(con);     
   ResultSet getcompteDemEx = demandeurExt.getCompDemEx(con); 

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
     
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

 </head>
 <style>
/* Styles personnalisés pour le bouton */
#notification-btn {
  padding: 10px 20px;
  background-color: #3085d6;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
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
                                <a href="table demandeur externe.jsp">> <span>Liste demandeurs externes </span> <% out.println(getcompteDemEx.getString("compteE")); %></a>
                            </li>
                        <% } %> 
                        <% while (getcompteDemIn.next()) { %>
                            <li>
                                <a href="table demandeur interne.jsp">> <span>Liste demandeurs internes </span> <% out.print(getcompteDemIn.getString("compteI")); %></a>
                            </li>
                        <% } %>
                            
                        </ul>
                     </li>
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Demandeur en teste
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
                        Demandeur accepter
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table demandeur externe accepter.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span></a>
                        </li>
                        <li>
                           <a href="table demandeur interne accepter.jsp">
                           <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span></a>
                        </li>
                      </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Demandeur supprimer
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

               <!-- Inclure les fichiers CSS et JS de SweetAlert2 -->

        <!-- Bouton pour déclencher la notification -->
            <button id="notification-btn">Afficher la notification</button>
            </div>   
        </div>
                                 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
        // Écouter l'événement clic sur le bouton
        document.getElementById('notification-btn').addEventListener('click', function() {
          // Afficher la notification avec Swal.fire()
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Your work has been saved',
            showConfirmButton: false,
            timer: 1500
          });
        });
    </script>
        
        
         
   </body>
</html>