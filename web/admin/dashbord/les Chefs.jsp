<%@page import="table.chef"%>
<%@page import="table.nosmetier"%>
<%@page import="table.sexe"%>
<%@page import="table.sousTitre"%>
<%@ page import="table.employeur" %>
<%@ page import="table.visiteur" %>
<%@page import="table.admin"%>
<%@page import="table.demande_accExt"%>
<%@page import="table.demande_accInt"%>
<%@page import="table.demande_refEx"%>
<%@page import="table.demande_refInt"%>
<%@page import="table.demandeurExt"%>
<%@page import="table.demandeurInt"%>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_admin= (String) session.getAttribute("email");
    String etat = (String) request.getParameter("etat");
    out.println(etat);
    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    ResultSet Allchefs = chef.getAllChef(con);  
    ResultSet result = nosmetier.getnosMetier(con); 

    ResultSet getIdVisit = employeur.getIdAllVisiteur(request.getParameter("id_visit"),con);   
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
      <title>Value-IT -  Admin </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">

      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />

    <!-- message css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

   </head>
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
                                 <%-- prend l'admin  --%>
                                    <% while (V_res1.next()) { %>
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                       <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                          <%}%>                                   
                                       <div class="dropdown-menu">
                                       
                                 <%-- si l'admin est connecté  --%>

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
                <div class="midde_cont">
                    <div class="container-fluid">
                        <div class="row column_title">
                            <div class="col-md-12">
                                <div class="page_title">
                                    <h2>Les Chefs</h2>
                                </div>
                            </div>
                        </div>
               <!-- chef -->
                        
                        <div class="tab-pane" id="metiers" role="tabpanel" aria-labelledby="metiers-tab">
                           <div>
                               <div class="dash_head">
                                 <h3><span><i class="fa fa-tag"></i> Nos chefs </span></h3>
                               </div>
                            </div>
                            
                                <div class="col-md-12 mt-4 mb-5">
                                      <button type="button"
                                          class="btn btn-success mb-4" 
                                          data-bs-toggle="modal"
                                          data-bs-target="#chefs" 
                                          data-bs-whatever=""
                                          data-bs-toggle="tooltip"
                                          data-bs-placement="bottom" 
                                          title="Ajout"
                                          style="float: right;">
                                          <i class="fa fa-plus-circle"></i> 
                                      </button>
                                 </div>

                                <table class="table" >
                                    <thead>
                                        <tr>
                                           <th scope="col">Photo</th>
                                           <th scope="col">Nom</th>          
                                           <th scope="col">Prenom</th> 
                                           <th scope="col">metier</th>  

                                           <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                   <% while (Allchefs.next()) { %>

                                       <tbody>
                                       <tr>
                                           <td style="vertical-align: middle;">
                                                <div class="user_img"><img style="margin-top: -13px;" class="img-responsive" src="../../image/<% out.println(Allchefs.getString("imageLead")); %>" alt="#" /></div>
                                           </td>
                                           <td style="vertical-align: middle;">
                                                <% out.println(Allchefs.getString("nomLead")); %>
                                           </td>
                                           <td style="vertical-align: middle;">
                                                <% out.println(Allchefs.getString("prenomLead")); %>
                                           </td>
                                            <td style="vertical-align: middle;">
                                                <% out.println(Allchefs.getString("nom_nosMet")); %>
                                            </td>

                                           <td style="vertical-align: middle;">
                                             <a href="modification/chefs.jsp?id=<% out.println(Allchefs.getString("id_lead")); %>">
                                                <button  type="button"  
                                                         class="btn btn-warning"
                                                         data-bs-toggle="tooltip"
                                                         data-bs-placement="bottom" 
                                                         title="Modifiation"
                                                         data-bs-toggle="modal" 
                                                         data-bs-target="#ModalExempl" 
                                                         data-bs-whatever="@getbootstrap">
                                                   <i class="fa fa-edit"></i> 
                                                </button>
                                             </a>
                                           </td>
                                       </tr>
                                   </tbody>
                                  <%}%>
                                 </table>
                               </div>
                        </div>

                     </div>
                     <!-- Modal nos metier --> 
                    <form class="job" method="post" action="../../insertionChef"  enctype="multipart/form-data" >

                        <div class="modal fade" id="chefs" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Nouveau chef</h5>
                                        <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                            <i class="fa fa-close red_color"></i>
                                        </span>
                                    </div>
                                    <div class="modal-body">
                                        <div class="msg_list_main">
                                            <div class="dash_head">
                                               <h3><span><i class="fa fa-tags"></i> Nouveau chef </span>
                                               </h3>     
                                            </div>
                                            <div class="col-md-10">
                                                <div class="mb-3">
                                                    <label for="exampleFormControlInput1" class="form-label">choisisier le metier</label>
                                                    <select name="id" id="mySelect" class="form-control" aria-label="Default select example">
                                                       <option selected>Choisissez le metier </option>
                                                       <% while (result.next()) { %>
                                                          <option value="<% out.println(result.getString("id_nosMet")); %>">
                                                                <% out.println(result.getString("nom_nosMet")); %>
                                                          </option>
                                                       <% }%>
                                                    </select>
                                                    <div class="mb-3">
                                                       <label for="exampleFormControlInput1" class="form-label">Nom</label>
                                                       <input class="form-control" type="text" name="nomChef">    
                                                    </div>

                                                    <div class="mb-3">
                                                       <label for="exampleFormControlInput1" class="form-label">Prenom</label>
                                                       <input class="form-control" type="text" name="prenomChef">    
                                                    </div>

                                                    <div class="input-group mb-3 btnInfo ajoutInfo">
                                                       <div class="form-group">
                                                          <label for="exampleFormControlFile1">choisisier la photo de profil</label>
                                                          <input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
                                                       </div>
                                                    </div> 
                                                
                                                    <div class="read_more">
                                                        <div class="center">
                                                            <input 
                                                             class="btn btn-success "              
                                                             data-bs-toggle="modal"
                                                             data-bs-target="#exampleModal1" 
                                                             data-bs-whatever=""
                                                             data-bs-toggle="tooltip"
                                                             data-bs-placement="bottom" 
                                                             onclick="validateForm()"
                                                             value="Enregistrer">
                                                        </div>
                                                    </div>
                                                    <%--   
                                                    <button id="notification-btn">Afficher la notification</button>
                                                    --%>
                                                    <%-- fin validation --%>
                                                    
                                               </div>                                             
                                           </div>
                                       </div>
                                   </div>
                               </div>
                            </div>
                        </div>
                        <!-- Message Oui ou Non -->     
                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                              <div class="modal-content">
                                <div class="modal-header">
                                  <h5 class="modal-title" id="exampleModalLabel">Accéptation</h5>
                                </div>
                                <div class="modal-body">
                                    <h4 class="modal-title" id="exampleModalLabel">êtes vous sûr d'enregistrer ?</h4>

                                    <div class="mt-4" style="display: flex;column-gaprow-gap: 4px;justify-content: end;column-gap: 22px;">
                                        <div class="accept">
                                            <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <div class="btn btn-danger "> NON </div>
                                            </span>
                                        </div>
                                        <div class="accept">
                                            <input class="btn btn-success " type="submit" value="Oui">
                                        </div>
                                    </div>
                                </div>
                              </div>
                            </div>
                        </div>    
                    </form>

                     <!-- fin Modal nos metier -->         
               
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        
        
        <script>
            var exampleModal = document.getElementById('exampleModal1')
            exampleModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget
            var modalTitle = exampleModal.querySelector('.modal-title')
            var modalBodyInput = exampleModal.querySelector('.modal-body input')
            modalTitle.textContent = 'Accï¿½ptation' 
            })
        </script> 
        <script src="js/jquery.min.js"></script>   
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

        <script src="js/bootstrap.min.js"></script>
        <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>
        <!--  nos metiersjs -->
        <script>
            var exampleModal = document.getElementById('chefs')
            exampleModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget
            var modalTitle = exampleModal.querySelector('.modal-title')
            var modalBodyInput = exampleModal.querySelector('.modal-body input')
            modalTitle.textContent = 'Nouveau chef ' 
            })
        </script> 
        <script>
           var ps = new PerfectScrollbar('#sidebar');
        </script>
        <!-- custom js -->
        <script src="js/chart_custom_style1.js"></script>
        <script src="js/custom.js"></script>
      
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
        
   </body>
</html>