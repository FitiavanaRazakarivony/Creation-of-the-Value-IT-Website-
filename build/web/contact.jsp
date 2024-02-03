<%@page import="table.contact_ext"%>
<%@page import="table.nosmetier"%>
<%@page import="table.sexe"%>
<%@page import="table.sousTitre"%>
<%@ page import="table.employeur" %>
<%@ page import="table.visiteur" %>
<%@page import="table.admin"%>


<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    
    ResultSet AllCont = contact_ext.getMessagChef(con);

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
      <title>Value-IT -  Admin </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">

      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />
      <!-- fontawesome-->
      <link rel="stylesheet" href="../dashbord/css/font-awesome.min.css">


   </head>
   <style>
      body {
  position: relative;
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
                            <a href="../../index.jsp">
                            </a>
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
                                 <%-- prend l'admin  --%>
                                    <% while (V_res1.next()) { %>
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                       <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                          <%}%>                                   
                                       <div class="dropdown-menu">
                                       <a class="dropdown-item" href="profile.jsp">Profile</a>
                                 <%-- si l'admin est connectÃ©  --%>

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
               <!-- contact -->
               <div class="midde_cont">
                  <div class="container-fluid">
                      <div class="row column_title">
                         <div class="col-md-12">
                            <div class="page_title">
                               <h2>Contacts</h2>
                            </div>
                         </div>
                      </div>
                     <table class="table">
                     <thead>
                     <tr>
                        <th scope="col">Nom</th>
                        <th scope="col">Prenom</th>
                        <th scope="col">Messages</th>
                        <th scope="col">Action</th>
                     </tr>
                     </thead>
                     
                    <% while (AllCont.next()) { %> 

                     <tbody>
                     <tr>
                        <th><% out.println(AllCont.getString("nom_contExt")); %></th>
                        <td><% out.println(AllCont.getString("prenom_contEx")); %></td>
                        <td><% out.println(AllCont.getString("contact_contExt")); %></td>  
                        <td>
                            <a href=""> voir</a>
                            <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@<% out.println(AllCont.getString("nom_contExt")); %> <% out.println(AllCont.getString("prenom_contEx")); %>"> Repondre</a>
                        </td>

                     </tr>
                     </tbody>
                    <%}%>
                     </table>
                  </div>
               </div>
               <!-- fin contact -->
            </div>
               <!-- Repondre le message -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                     <h5 class="modal-title" id="exampleModalLabel">Nouveau message</h5>
                        <span class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="fa fa-close red_color"></i> </span>
                     </div>
                     <div class="modal-body">
                     <form>
                        <div class="mb-3">
                           <label for="recipient-name" class="col-form-label">Recipient:</label>
                           <input type="text" class="form-control" id="recipient-name" disabled="false">
                        </div>
                        <div class="mb-3">
                           <label for="message-text" class="col-form-label">Message:</label>
                           <textarea class="form-control" id="message-text"></textarea>
                        </div>
                     </form>
                     </div>
                     <div class="modal-footer">
                     <button type="button" class="btn btn-primary">Envoyer</button>
                     </div>
                  </div>
               </div>
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
      <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>
      <script >
         var exampleModal = document.getElementById('exampleModal')
         exampleModal.addEventListener('show.bs.modal', function (event) {
         // Button that triggered the modal
         var button = event.relatedTarget
         // Extract info from data-bs-* attributes
         var recipient = button.getAttribute('data-bs-whatever')
         // If necessary, you could initiate an AJAX request here
         // and then do the updating in a callback.
         //
         // Update the modal's content.
         var modalTitle = exampleModal.querySelector('.modal-title')
         var modalBodyInput = exampleModal.querySelector('.modal-body input')

         modalTitle.textContent = 'Nouveau message à ' + recipient
         modalBodyInput.value = recipient
         })
      </script>

   </body>
</html>