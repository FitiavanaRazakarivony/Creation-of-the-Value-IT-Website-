<%@page import="table.nosmetier"%>
<%@page import="table.admin"%>

<%@page import="table.sousTitre"%>
<%@page import="table.employeur"%>
<%@page import="table.titre"%>
<%@ page import="table.visiteur" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    
    ResultSet res = sousTitre.getAllTitre(con);   
    ResultSet resul = nosmetier.getnosMetier(con); 

    ResultSet resSous = sousTitre.getAllTitre(con);
    ResultSet getSous_Titre = sousTitre.getAllTitreSousTitre(con);


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
      <title>Value-IT - publication</title>
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
                              <ul class="user_soustitre_dd">
                                 <li>
                                    <% while (V_res1.next()) { %>
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                       <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                          <%}%>                                   
                                       <div class="dropdown-menu">
                                       <a class="dropdown-item" href="soustitre.jsp">soustitre</a>
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
               <!-- dashboard -->
               <div class="midde_cont">
                  <div class="container-fluid">
                     <div class="row column_title">
                        <div class="col-md-12">
                           <div class="page_title">
                              <h2>publication</h2>
                           </div>
                        </div>
                     </div>

                     <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Titre</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="messages-tab" data-bs-toggle="tab" data-bs-target="#messages" type="button" role="tab" aria-controls="messages" aria-selected="false">Sous titre</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Publication</button>
                        </li>
                     </ul>
                      
                     <div class="tab-content">
                        <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                             <!-- titre -->
                           <div class="col-md-6">
                              <div class="dash_blog">
                                 <div class="dash_blog_inner">
                                    <div class="dash_head">
                                       <h3><span><i class="fa fa-tag"></i> Titre</span></h3>
                                    </div>
                                    <div class="msg_list_main">
                                       <div class="col-md-8">
                                          <form method="post" action="../../titrePub" >
                                             <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Titre</label>
                                                <input type="text" class="form-control" name="ajout_titre">
                                             </div>
                                             <div class="read_more">
                                                <div class="center"><input class="btn btn-success " type="submit" value="Enregistrer">
                                                </div>
                                             </div>
                                          </form>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="messages" role="tabpanel" aria-labelledby="messages-tab">
                                                <!-- ajout sous titre -->
                           <div class="row column4 graph">
                              <div class="col-md-6" data-aos="fade-left">
                                 <div class="dash_blog">
                                    <div class="dash_blog_inner">
                                       <div class="dash_head">
                                          <h3><span><i class="fa fa-tags"></i> Sous titre</span><span class="plus_green_bt" data-bs-toggle="tooltip" data-bs-placement="bottom" title="ajout la sous titre"><a href="#">+</a></span></h3>                        
                                       </div>
                                       
                                       <div class="msg_list_main">
                                          <div class="col-md-9">
                                             <label for="exampleFormControlInput1" class="form-label">Choisir le metier</label>
                                             <form method="post" action="../../sousTitre" enctype="multipart/form-data"> 
                                                <select name="id" class="form-control" >
                                                   <option selected>Choisissez le titre </option>
                                                   <% while (resSous.next()) { %>
                                                      <option value="<%out.println(resSous.getString("id_tittrePub")); %>">
                  
                                                         <%out.println(resSous.getString("titre_pub")); %>
                                                      </option>
                                                   <% }%>
                                                </select>
                                                <div class="mb-3">
                                                   <label for="exampleFormControlInput1" class="form-label">Sous titre </label>
                                                   <input type="text"  class="form-control" name="ajout_soustitre">
                                                </div>
                                                
                                                <div class="input-group mb-3 btnInfo ajoutInfo">
                                                      <div class="form-group">
                                                         <label for="exampleFormControlFile1">choisisier votre image de publication</label>
                                                         <input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
                                                      </div>
                                                </div> 
                                                
                                                <div class="read_more">
                                                   <div class="center"><input class="btn btn-success " type="submit" value="Enregistrer">
                                                   </div>
                                                </div>                                    
                                             </form>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                                                <!-- ajout publication -->
                           <div class="col-md-12">
                              <div class="dash_blog">
                                 <div class="dash_blog_inner">
                                    <div class="dash_head">
                                       <h3><span><i class="fa fa-tag"></i> Publication</span></h3>
                                    </div>
                                    <div class="msg_list_main">
                                       <div class="col-md-8">
                                          <div class="mb-3">
                                             <label for="exampleFormControlInput1" class="form-label">
                                                <a href="#informSuppl"><i class="fa fa-edit"></i> Ajout titre</a>
                                             </label>
                                          </div>

                                          <div class="mb-3">
                                             <label for="exampleFormControlInput1" class="form-label">
                                                <a href="#informSuppl"><i class="fa fa-edit"></i> Ajout sous titre</a>
                                             </label>
                                          </div>

                                          <form method="post" action="../../FileUploadServlet"  >
                                             <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Choisissez la date de la publicaiton</label>
                                                <input class="ajoutInforma form-control" type="date"  name="date_pub">
                                             </div>
                                             
                                             <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Choisissez le nom de la publicaiton</label>
                                                <select name="id_titreP" class="form-control">
                                                   <option selected>Choisissez le nom de la publication </option>
                                                   <% while (getSous_Titre.next()) { %>
                                                         <option value="<% out.println(getSous_Titre.getString("id_tittrePub")); %>">
                                                         <% out.println(getSous_Titre.getString("titre_pub")); %> :

                                                            <% out.println(getSous_Titre.getString("soustitre_pub")); %> 

                                                         </option>
                                                   <% }%>
                                                </select>
                                             </div>

                                             <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Ajout informations de la publicaton</label>
                                                <div class="ajoutInfo">

                                                   <div class="form-group">
                                                         <textarea class="form-control Information" id="exampleFormControlTextarea1" rows="3" required name="info_Pub"></textarea>
                                                   </div>
                                                
                                                   <div class="read_more">
                                                      <div class="center"><input class="btn btn-success " type="submit" value="Enregistrer">
                                                   </div>
                                                </div>
                                             </div>
                                          </form>
                                       </div>
                                       
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>


                  <!-- 
                  <div class="container-fluid">
                     <div class="footer">
                        <p>Copyright © 2018 Designed by html.design. All rights reserved.<br><br>
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
      <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>
      <script src="js/chart_custom_style1.js"></script>
      <script src="js/custom.js"></script>
      <script src="js/js_navs&bar/js_navs.js"></script>
      
   </body>
</html>