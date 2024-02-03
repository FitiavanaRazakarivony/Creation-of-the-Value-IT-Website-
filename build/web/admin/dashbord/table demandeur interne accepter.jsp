
<%@page import="table.employeur"%>
<%@page import="table.admin"%>

<%@ page import="table.demandeurInt" %>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>
<%@page import="table.demande_accExt"%>
<%@page import="table.demande_accInt"%>
<%@page import="table.demande_refEx"%>
<%@page import="table.demande_refInt"%>
<%@page import="table.demandeurExt"%>
<%@page import="table.demandeurInt"%>

<%
   String email_admin= (String) session.getAttribute("email");
   Connection con = Connexion.connect();
   ResultSet V_res = admin.afficherAdmin(email_admin, con);
   ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

   ResultSet AllInter = demandeurInt.getInterne1Acc(con); 
 
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
                              <a href="index.jsp"></a>
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
                                 <h2>Liste demandeurs internes acceptées</h2> 
                                <span id="message-error" style="display: none; color:red;">Veuillez entrer votre nom!.</span>

                              </div>
                           </div>
                        </div>  
                         
                        <div class="input-group mb-3 col-lg-4" style="float: inline-end;">
                            <input type="text" id="searchCode" name="recherche" placeholder="Rechercher" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                        </div>
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
                                 <td class="row btn-action">
                                       <a class="text-uppercase" 
                                       href="demandeur Interne.jsp?id=<% out.println(AllInter.getString("id_eurInt")); %>">
                                           <img 
                                                title="Voir"
                                                data-bs-toggle="modal" 
                                                data-bs-target="#" 
                                                src="../../images/hypermetropie.png"
                                                class="btn-voir"
                                            >
                                       </a>                       
                                           
                                       <%-- suppression interne accepter --%>
                                       
                                    <form method="post" action="../../suppressionDemande_accInt" >
                                       <img             
                                            title="Supprimer"
                                            data-bs-toggle="modal"
                                            data-bs-target="#btnSuppr" 
                                            data-bs-toggle="tooltip"
                                            prend_id="<% out.println(AllInter.getString("id_testeInter")); %>"
                                            data-bs-placement="bottom" src="../../images/supprimer.png"
                                            class="btn-supprimer"
                                        >
                                    <div class="modal fade" id="btnSuppr" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                          <div class="modal-content">
                                            <div class="modal-header">
                                              <h5 class="modal-title" id="exampleModalLabel">Accéptation</h5>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" class="form-control" name="recipient" value="<% out.println(AllInter.getString("email_visit")); %>" id="recipient-name">
                                                <input type="text" class="id form-control" name="id" value="<% out.println(AllInter.getString("id_testeInter")); %>" id="recipient-name">
                                                <h4 class="modal-title" id="exampleModalLabel">êtes vous sûr de supprimer ?</h4>
                                                <div class="mt-4" style="display: flex;column-gaprow-gap: 4px;justify-content: end;column-gap: 22px;">
                                                    <div class="accept">
                                                        <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                            <div class="btn btn-danger "> NON </div>
                                                        </span>
                                                    </div>
                                                    <div class="accept">
                                                        <button class="btn btn-success" type="submit">
                                                            OUI
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                   </form>
                                    <a href="modification/Modification interne accepter.jsp?id=<% out.println(AllInter.getString("id_testeInter")); %>">
                                        <img             
                                             title="Modifier"
                                             data-bs-toggle="modal"
                                             data-bs-target="#exampleModal" 
                                             data-bs-toggle="tooltip"
                                             data-bs-placement="bottom" src="../../images/modifie.png"
                                             class="btn-modifier"
                                         >
                                     </a>

                                </td>
                              </tr>
                           </tbody>
                        <%}%>
                        </table>        
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
      <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>
      <script>
        var exampleModal = document.getElementById('exampleModal')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var recipient = button.getAttribute('data-bs-recipient')   
        
        var id = button.getAttribute('data-bs-id')
        var modalBodyClassId = exampleModal.querySelector('.modal-body .id')
        
        var nosMet = button.getAttribute('data-bs-nosMet')
        var modalBodyClassNosMet = exampleModal.querySelector('.modal-body .nosMet')


        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')   
        
        modalTitle.textContent = 'Repondre message ' 
        modalBodyInput.value = recipient 
        modalBodyClassId.value = id   
        modalBodyClassNosMet.value = nosMet       
    
        })
     </script>
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
        
        var messageError = document.getElementById("message-error");


        searchInput.addEventListener('keyup', function(event) {
            const searchString = event.target.value.toLowerCase();
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(searchString)) {
                    row.style.display = 'table-row';
                    messageError.style.display = "none";

                }else {
                    row.style.display = 'none';
                    messageError.style.display = "inline";
                    input.style.border = "1px solid #ccc";
                }
            });
       
        });
    </script>
    <script>
        //acceptation dans le suppression
        var exampleModal = document.getElementById('btnSuppr')
        exampleModal.addEventListener('show.bs.modal', function (event) {
          var button = event.relatedTarget
          
            var id = button.getAttribute('prend_id')
            var modalBodyId = btnSuppr.querySelector('.modal-body .id')


          var modalTitle = btnSuppr.querySelector('.modal-title')
          var modalBodyInput = btnSuppr.querySelector('.modal-body input')

          modalTitle.textContent = 'New message to ' + id
          modalBodyInput.value = id
        })


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