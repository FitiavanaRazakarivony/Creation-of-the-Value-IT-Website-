<%@page import="table.admin"%>
<%@page import="table.nosmetier"%>
<%@page import="table.sousTitre"%>
<%@page import="table.typeContrat"%>
<%@ page import="table.employeur" %>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
 

    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    
    ResultSet AllTypCon = typeContrat.getAllTypeContrat(con);
    ResultSet res = nosmetier.getnosMetier(con); 
    ResultSet resann = nosmetier.getnosMetier(con); 
    ResultSet rescompt = nosmetier.getnosMetier(con); 

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
      <title>Value-IT - Annonce</title>
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
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
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
                                   </div>
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
                                 <h2>Annonce</h2>
                              </div>
                           </div>
                        </div>
                        

                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                          <button class="nav-link active" id="Objet-tab" data-bs-toggle="tab" data-bs-target="#Objet" type="button" role="tab" aria-controls="Objet" aria-selected="true">Objet de la demande</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="metiers-tab" data-bs-toggle="tab" data-bs-target="#metiers" type="button" role="tab" aria-controls="metiers" aria-selected="false">Nos metiers</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="contrat-tab" data-bs-toggle="tab" data-bs-target="#contrat" type="button" role="tab" aria-controls="contrat" aria-selected="false">Type contrat</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="Information-tab" data-bs-toggle="tab" data-bs-target="#Information" type="button" role="tab" aria-controls="Information" aria-selected="false">Information supplementaire</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="Competence-tab" data-bs-toggle="tab" data-bs-target="#Competence" type="button" role="tab" aria-controls="Competence" aria-selected="false">Competence</button>
                        </li>
                        <li class="nav-item" role="presentation">
                          <button class="nav-link" id="Annonce-tab" data-bs-toggle="tab" data-bs-target="#Annonce" type="button" role="tab" aria-controls="Annonce" aria-selected="false">Annonce</button>
                        </li>
                    </ul>

                    <div class="tab-content">
                      <!-- objet de la demande -->
                        <div class="tab-pane active" id="Objet" role="tabpanel" aria-labelledby="Objet-tab">
                           <div class="col-md-12">
                              <div class="dash_blog">
                                    <div class="dash_blog_inner">
                                       <div class="dash_head">
                                          <h3><span><i class="fa fa-tag"></i> Objet de la demande </span></h3>
                                       </div>

                                       <div class="msg_list_main">
                                          <div class="col-md-10">
                                             <form method="post" action="../../insertionObjet_DemandeI">
                                                <div class="mb-3">
                                                      <label  class="form-label">Ajout Objet de la demande</label>
                                                      <input type="text" class="form-control"  name="objet_demandeI">
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
                      <!-- fin objet de la demande -->

                      <!-- nos metiers -->
                      <div class="tab-pane" id="metiers" role="tabpanel" aria-labelledby="metiers-tab">
                          <div class="col-md-12">
                              <div class="dash_blog">
                                  <div class="dash_blog_inner">
                                    <div class="dash_head">
                                       <h3><span><i class="fa fa-tags"></i> Nos metiers </span>
                                       </h3>     
                                    </div>
                                  </div>
                                  <div class="msg_list_main">
                                      <div class="col-md-10">
                                          <div class="mb-3">
                                             <label for="exampleFormControlInput1" class="form-label"> Nom </label>
                                              <form class="job" action="../../estinsertJob" method="POST">
                                                  <div class="mb-3">
                                                     <input class=" form-control chps" type="text" name="nom_nosMet" required/>
                                                  </div>

                                                  <div class="form-group mb-3 ">
                                                     <label for="exampleFormControlInput1" class="form-label">Description de metiers</label>
                                                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="desc_nosMet" required ></textarea>
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
                      <!-- fin nos metiers -->

                      <!-- type contrat -->
                      <div class="tab-pane" id="contrat" role="tabpanel" aria-labelledby="contrat-tab">
                          <div class="col-md-12">
                              <div class="dash_blog">
                                  <div class="dash_blog_inner">
                                       <div class="dash_head">
                                          <h3><span><i class="fa fa-tag"></i> Type contrat</span></h3>
                                       </div>

                                      <div class="msg_list_main">
                                          <div class="col-md-10">
                                            <form method="post" action="../../insertionTypeCon">
                                               <div class="mb-3">
                                                     <label  class="form-label">Ajout type de contrat</label>
                                                     <input type="text" class="form-control"  name="ajout_typeCont">
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
                      <!-- fin type contrat -->

                      <!-- information supplementaire -->
                      <div class="tab-pane" id="Information" role="tabpanel" aria-labelledby="Information-tab">
                          <section id="informSuppl" class="col-md-12">
                              <div>
                                  <div class="dash_blog">
                                      <div class="dash_blog_inner">
                                         <div class="dash_head">
                                            <h3><span><i class="fa fa-tags"></i> Information supplementaire </span>
                                            </h3>                     
                                         </div>

                                          <div class="msg_list_main">
                                              <div class="col-md-9">
                                                  <form action="../../informSuppl" method="POST" >

                                                      <div class="mb-3">
                                                         <label for="exampleFormControlInput1" class="form-label"></label>
                                                         <select name="id_nosMet" class="form-control">
                                                            <option selected>Choisissez le metier </option>
                                                            <% while (res.next()) { %>
                                                                <option value="<%out.println(res.getString("id_nosMet")); %>">
                                                                    <% out.println(res.getString("nom_nosMet")); %>
                                                                </option>
                                                            <% }%>
                                                         </select>
                                                      </div>

                                                      <div class="mb-3">
                                                         <label for="exampleFormControlInput1" class="form-label"></label>
                                                        <div class="ok">

                                                            <select name="id_typeContrat" class="form-control">
                                                               <option selected>Choisissez type de contrat </option>
                                                               <% while (AllTypCon.next()) { %>
                                                                  <option value="<%out.println(AllTypCon.getString("id_typeContra")); %>">
                                                                     <% out.println(AllTypCon.getString("type_Contrat")); %>
                                                                  </option>
                                                               <% }%>
                                                            </select>
                                                            <div>
                                                               <span class="plus_green" data-bs-toggle="tooltip" data-bs-placement="bottom" title="ajout la Type contrat"></span>
                                                            </div>
                                                         </div>

                                                      </div>

                                                      <div class="mb-3">
                                                         <label  class="form-label">Salaire</label>
                                                         <input type="text" class="form-control" name="sal" id="exampleFormControlInput1" >
                                                      </div>

                                                      <div class="mb-3">
                                                         <label  class="form-label">Horaire de travaille</label>
                                                         <input type="text" class="form-control" name="horairTrav" id="exampleFormControlInput1" >
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
                          </section>
                      </div>
                      <!-- fin information supplementaire -->

                      <!-- competence -->
                      <div class="tab-pane" id="Competence" role="tabpanel" aria-labelledby="Competence-tab">
                          <div class="col-md-12">
                              <div class="dash_blog">
                                  <div class="dash_blog_inner">
                                      <div class="dash_head">
                                         <h3><span><i class="fa fa-tags"></i> competence </span>
                                         </h3>                                
                                      </div>
                                  </div>
                                  <div class="msg_list_main">
                                      <div class="col-md-8">

                                          <form method="post" action="../../insertionCompt" >

                                              <div class="mb-3">
                                                 <label for="exampleFormControlInput1" class="form-label"> Choisissez le metier </label>
                                                 <select name="id_nosMet" class="form-control">
                                                    <option selected>Choisissez le metier </option>
                                                    <% while (rescompt.next()) { %>
                                                        <option value="<%out.println(rescompt.getString("id_nosMet")); %>">
                                                            <% out.println(rescompt.getString("nom_nosMet")); %>
                                                        </option>
                                                    <% }%>
                                                 </select>
                                              </div>

                                              <div class="mb-3">
                                                 <label for="exampleFormControlInput1" class="form-label">Competence</label>
                                                 <input type="text" class="form-control" name="compt">
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
                      <!-- fin competence -->

                      <!-- annonce -->
                      <div class="tab-pane" id="Annonce" role="tabpanel" aria-labelledby="Annonce-tab">
                          <div class="col-md-12">
                              <div class="dash_blog">
                                  <div class="dash_blog_inner">
                                      <div class="dash_head">
                                          <h3>
                                              <span>
                                                  <i class="fa fa-tags"></i> Annonce 
                                              </span>
                                          </h3>                                 
                                      </div>
                                  </div>
                                  <div class="msg_list_main">
                                      <div class="col-md-8">
                                        <div class="mb-3">
                                           <form class="job" action="../../insertionAnnonce" method="POST">

                                              <div class="mb-3 ">
                                                     <label for="exampleFormControlInput1" class="form-label">chosissez le metiez</label>
                                                  <div class="ok">

                                                     <select name="id_nosMet" id="mySelect" class="form-control" aria-label="Default select example">
                                                        <option selected>Choisissez le metier </option>
                                                        <% while (resann.next()) { %>
                                                           <option value="<% out.println(resann.getString("id_nosMet")); %>">
                                                                 <% out.println(resann.getString("nom_nosMet")); %>
                                                           </option>
                                                        <% }%>
                                                     </select> 
                                                     <div>
                                                        <span class="plus_green" data-bs-toggle="tooltip" data-bs-placement="bottom" title="ajout la Type contrat"></span>
                                                     </div>
                                                  </div>
                                              </div>
                                              <div class="form-group mb-3">
                                                    <label for="exampleFormControlInput1" class="form-label">Annonce</label>
                                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="annonce" required ></textarea>
                                              </div>

                                              <label>Vue par : </label>
                                                  <div class="form-check mb-3">
                                                     <input class="form-check-input" type="radio" name="typeAnn" id="flexRadioDefault1" value="0">
                                                     <label class="form-check-label" for="flexRadioDefault1">
                                                        visiteur
                                                     </label>
                                                  </div>
                                                  <div class="form-check ">
                                                     <input class="form-check-input" type="radio" name="typeAnn" id="flexRadioDefault2" checked value="1">
                                                     <label class="form-check-label" for="flexRadioDefault2">
                                                        Travailleur
                                                     </label>
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
      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.min.js"></script>

      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
 
      <script src="bootstrap V5/js/bootstrap.bundle.min.js"></script>
      <script>
      var firstTabEl = document.querySelector('#myTab li:last-child a')
      var firstTab = new bootstrap.Tab(firstTabEl)

      firstTab.show()
      </script>
      
   </body>
</html>