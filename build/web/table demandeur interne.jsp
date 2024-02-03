
<%@page import="table.employeur"%>
<%@page import="table.admin"%>

<%@ page import="table.demandeurInt" %>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
   String email_admin= (String) session.getAttribute("email");
   Connection con = Connexion.connect();
   ResultSet V_res = admin.afficherAdmin(email_admin, con);
   ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

   
   ResultSet AllInter = demandeurInt.getDemandeurInterne(con); 
 
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
      <title>Value-IT -  table demandeur interne </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
           
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />


   </head>
 
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="index.jsp"></a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <% while (V_res.next()) { %> 
                           <div class="user_img"><img class="img-responsive" src="../../image/<% out.println(V_res.getString("image_admin")); %>" alt="image" /></div>
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
                     <li><a href="price.jsp"><i class="fa fa-briefcase blue1_color"></i> <span>Pricing Tables</span></a></li>
                     <li>
                        <a href="contact.jsp">
                        <i class="fa fa-phone red_color"></i> <span>Contact</span></a>
                     </li>
                     <li class="active">
                        <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-briefcase yellow_color"></i> <span> Liste des demandes</span></a>
                        <ul class="collapse list-unstyled" id="additional_page">
 
                           <li>
                              <a href="table demandeur interne.jsp">> <span>Liste demandeur interne</span></a>
                           </li>
                           <li>
                              <a href="table demandeur externe.jsp">> <span>Liste demandeur externe</span></a>
                           </li>
                        </ul>
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
                              <a href="index.jsp"></a>
                           </div>
                           <div class="right_topbar">
                              <div class="icon_info">
                                 <ul>
                                    <li><a href="#"><i class="fa fa-bell-o"></i><span class="badge">2</span></a></li>
                                    <li><a href="#"><i class="fa fa-question-circle"></i></a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i><span class="badge">3</span></a></li>
                                 </ul>
                                 <ul class="user_profile_dd">
                                    <li>
                                       <% while (V_res1.next()) { %>
                                          <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="images/layout_img/user_img.jpg" alt="#" />
                                          <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                             <%}%>                                   
                                          <div class="dropdown-menu">
                                          <a class="dropdown-item" href="profile.jsp">Profile</a>
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
                                 <h2>Liste demandeur interne</h2> 
                              </div>
                           </div>
                        </div>  
                         
                        <form method="POST" action="RechercheNosMet">
                           <input type="hidden" name="estrecherche">
                           <!-- <input type="text" name="recherche" placeholder="Rechercher"> -->
                           <div class="input-group mb-3 col-lg-4" style="float: inline-end;">
                           <input type="text" id="searchCode" name="recherche" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">

                           <div class="input-group-prepend">
                               <input type="submit" value="rechercher" class="btnRecherche input-group-text">
                           </div>
                           </div>
                        </form>

                         <table class="table">
                           <thead>
                              <tr>
                                 <th scope="col">Nom</th>
                                 <th scope="col">Prenom</th>
                                 <th scope="col">Email</th> 
                                 <th scope="col">Metier</th>
                                 <th scope="col">Sexe</th>
                                 <th scope="col">Action</th>
                              </tr>
                           </thead>
                              <% while (AllInter.next()) { %>
                           <tbody>
                              <tr>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllInter.getString("nom_visit")); %>
                                 </td>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllInter.getString("prenom_visit")); %>
                                 </td>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllInter.getString("email_visit")); %>
                                 </td>
                                 <td style="vertical-align: middle;">                               
                                    <% out.println(AllInter.getString("nom_nosMet")); %>
                                 </td>
                                 <td style="vertical-align: middle;">
                                    <% out.println(AllInter.getString("sexe")); %>
                                 </td>
                                 <td class="row" style="vertical-align: middle;">
                                       <a class="btn btn-primary  text-uppercase" 
                                       href="demandeur Interne.jsp?id=<% out.println(AllInter.getString("id_eurInt")); %>"> <i class="fa fa-eye"></i> Voir plus</a>                          </div>
                                      <form method="post" action="../../insertionDemande_accIn" >
                                          <input type="hidden" value="<% out.println(AllInter.getString("id_eurInt")); %>" class="form-control" name="id_eurExt" id="exampleFormControlInput1" >
                                          <input class="btn btn-success " type="submit" value="Accepter">
                                      </form>
                                      <form method="post" action="../../insertionDemande_refIn" >
                                          <input type="hidden" value="<% out.println(AllInter.getString("id_eurInt")); %>" class="form-control" name="id_eurExt" id="exampleFormControlInput1" >
                                          <input class="btn btn-danger" type="submit" value="Supprimer">
                                      </form>
                                </td>
                              </tr>
                           </tbody>
                        <%}%>
                        </table>                         
                     </div>
                     <!-- 
                     <div class="container-fluid">
                        <div class="footer">
                           <p>RAZAKARIVONY Finonan Feno Fitiavna<br><br>
                              Distributed By: <a href="https://themewagon.com/">ThemeWagon</a>
                           </p>
                        </div>
                     </div>
                      -->

                </div>


               <!-- end dashboard inner -->
            </div>
         </div>
      </div>
     <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="js/chart_custom_style1.js"></script>
      <script src="js/custom.js"></script>
      <script>
         // Example starter JavaScript for disabling form submissions if there are invalid fields
         (function () {
            'use strict'
         
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
         
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
            .forEach(function (form) {
               form.addEventListener('submit', function (event) {
                  if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                  }
         
                  form.classList.add('was-validated')
               }, false)
            })
         })()
      </script>
      <script>
        const searchInput = document.getElementById("searchCode");
        const rows = document.querySelectorAll('.table tbody tr');

        searchInput.addEventListener('keyup', function(event) {
            const searchString = event.target.value.toLowerCase();
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchString)) {
                    row.style.display = 'table-row';
                }else {
                    row.style.display = 'none';
                }
            });
        });
    </script>

      
   </body>
</html>