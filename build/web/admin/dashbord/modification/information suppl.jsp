<%@page import="table.demande_accExt"%>
<%@page import="table.demande_accInt"%>
<%@page import="table.demande_refEx"%>
<%@page import="table.demande_refInt"%>
<%@page import="table.demandeurInt"%>
<%@page import="table.demandeurExt"%>
<%@page import="table.informSuppl"%>
<%@page import="table.typeContrat"%>
<%@page import="table.Objet_demandeI"%>
<%@page import="table.chef"%>
<%@page import="table.nosmetier"%>
<%@page import="table.admin"%>

<%@page import="table.sexe"%>
<%@page import="table.sousTitre"%>
<%@ page import="table.employeur" %>
<%@ page import="table.visiteur" %>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
     ResultSet V_res = admin.afficherAdmin(email_admin, con);
     ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    
    ResultSet AllSex = sexe.getAllSex(con); 
    ResultSet AllTypCon = typeContrat.getAllTypeContrat(con);
    ResultSet resann = nosmetier.getnosMetier(con); 
    ResultSet AllVisiteur = employeur.getAllVisiteur(con); 
    ResultSet AllIdInformation = informSuppl.getIdinformsuppl(request.getParameter("id"),con);
        
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
      <title>Value-IT - Modification </title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
           
      <!-- bootstrap css -->
      <link rel="stylesheet" href="../css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="../style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="../css/responsive.css" />


   </head>
 
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="../../../index.jsp">
                        </a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <% while (V_res.next()) { %> 
                           <div class="user_img">
                              <a href="../../../index.jsp">
                              <img class="img-responsive" src="../../../image/<% out.println(V_res.getString("image_admin")); %>" alt="image" />
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
                     <li><a href="../dashboard.jsp"><i class="fa fa-dashboard yellow_color"></i> <span>Dashboard</span></a></li>
                     <li><a href="../Les travailleurs.jsp"><i class="fa fa-laptop orange_color"></i> <span>Les travailleurs</span></a></li>
                     <li>
                        <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cart-plus purple_color2"></i> <span>Ajouts elements</span></a>
                        <ul class="collapse list-unstyled" id="element">
                           <li><a href="../Publication.jsp">> <span>Publication</span></a></li>
                           <li><a href="../les Chefs.jsp">> <span>Chef</span></a></li>
                           <li><a href="../annonce.jsp">> <span>annonce</span></a></li>
                           <li><a href="../Travailleur.jsp">> <span>Travailleur</span></a></li>
                        </ul>
                     </li> 

                     <li class="active">
                        <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-briefcase yellow_color"></i> <span> Liste des demandes</span></a>
                        <ul class="collapse list-unstyled" id="additional_page">
                        <% while (getcompteDemEx.next()) {  %> 
                            <li>
                                <a href="../table demandeur externe.jsp">> <span>Liste demandeurs externes </span> <a href="../#"><span class="badge"><% out.println(getcompteDemEx.getString("compteE")); %></span></a>
                            </li>
                        <% } %> 
                        <% while (getcompteDemIn.next()) { %>
                            <li>
                                <a href="../table demandeur interne.jsp">> <span>Liste demandeurs internes </span><span class="badge"><% out.print(getcompteDemIn.getString("compteI")); %></span> </a>
                            </li>
                        <% } %>
                            
                        </ul>
                     </li>
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../../images/agreement.png" alt="#" /> Demandeur en teste
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin" aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="../table teste du demandeur externe.jsp">>> <span> Les externes</span></a>
                        </li>
                        <li>
                            <a href="../table teste du demandeur interne.jsp">>> <span> Les internes</span></span></a>
                        </li>
                        
                      </ul>
                    </li>
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../../images/agreement.png" alt="#" /> Demandeur accepter
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <% while (getcompteAccEx.next()) {  %> 
                        <li>
                            <a href="../table demandeur externe accepter.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span> <span class="badge"><% out.println(getcompteAccEx.getString("compteDext")); %></span></a>
                        </li>
                        <% }  %>  
                        <% while (getcompteAccInt.next()) {  %> 
                        <li>
                           <a href="../table demandeur interne accepter.jsp">
                           <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span> <span class="badge"><% out.println(getcompteAccInt.getString("compteDint")); %></span></a>
                        </li>
                        <% }  %>  

                      </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 17px;" class="img-responsive rounded-circle" src="../../../images/delete-folder.png" alt="#" /> Demandeur supprimer
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <% while (getcompteSuppEx.next()) {  %> 
                        <li>
                            <a href="../table demandeur externe refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span><span class="badge"><% out.println(getcompteSuppEx.getString("comptSuppEx")); %></span></a>
                        </li>
                        <% }  %> 
                        <% while (getcompteSuppIn.next()) {  %> 
                        <li>
                            <a href="../table demandeur interne refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span> <span class="badge"><% out.println(getcompteSuppIn.getString("comptSuppIn")); %></span></a>
                        </li>
                        <% } %> 
                      </ul>
                    </li>
                    
                    <li>
                        <a href="../contact.jsp">
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
                              <a href="../index.jsp"></a>
                           </div>
                           <div class="right_topbar">
                              <div class="icon_info">
                                 
                                 <ul class="user_profile_dd">
                                    <li>
                                    <% while (V_res1.next()) { %>
                                       <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                       <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                          <%}%>                                   
                                       <div class="dropdown-menu">
                                       
                                       <% if (email_admin != null){ %>
                                          <form action="../../DeconServlet" method="GET">
                                             <a class="dropdown-item" href="../#">
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
                                 <h2>Modification information supplementaire</h2>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-12">
                           <div class="dash_blog">
                              <div class="dash_blog_inner">
                                    <div class="dash_head">
                                       <h3><span><i class="fa fa-edit"></i> Modification information supplementaire</span></h3>
                                    </div>
                                 
                                    <div class="msg_list_main">
                                    <div class="col-md-12">
                                       <div class="card-body">
                                          <%-- example --%>
                                          
                                          <% while (AllIdInformation.next()) { %>
                                        
                                            <form class="job" method="post" action="../../../information_supplementaire">
                                                
                                                <input type="text" class="form-control" id="validationCustom01" name="id" value="<% out.println(AllIdInformation.getString("id_nosMet")); %>" style="display: none;" required>
                                               
                                                <div class="mb-3">
                                                    <label for="exampleFormControlInput1" class="form-label"></label>
                                                    
                                                    <input type="text" class="form-control" id="exampleFormControlInput1" value="<% out.println(AllIdInformation.getString("nom_nosMet")); %>" disabled="false">
                                                    <select name="id_nosMet" class="form-control">
                                                       <option selected>Choisissez le metier </option>
                                                       <% while (resann.next()) { %>
                                                           <option value="<%out.println(resann.getString("id_nosMet")); %>">
                                                               <% out.println(resann.getString("nom_nosMet")); %>
                                                           </option>
                                                       <% }%>
                                                    </select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="exampleFormControlInput1" class="form-label"></label>
                                                    <div class="ok">
                                                        
                                                    <input type="text" class="form-control" id="exampleFormControlInput1" value="<% out.println(AllIdInformation.getString("type_Contrat")); %>" disabled="false">
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
                                                 <input type="text" class="form-control" name="sal" id="exampleFormControlInput1" value="<% out.println(AllIdInformation.getString("salaire")); %>" required>
                                                </div>

                                                <div class="mb-3">
                                                   <label  class="form-label">Horaire de travaille</label>
                                                   <input type="text" class="form-control" name="horairTrav" id="exampleFormControlInput1" value="<% out.println(AllIdInformation.getString("horairTrav")); %>" required>
                                                </div>

                                                <div class="read_more">
                                                   <div class="center"><input class="btn btn-success " type="submit" value="Enregistrer">
                                                   </div>
                                                </div>
                                            </form>
                                          <%}%>

                                       </div>
                                    </div>
                                    
                                 </div>
                                 
                              </div>
                           </div>
                        </div>   
                     </div>
                </div>


               <!-- end dashboard inner -->
            </div>
         </div>
      </div>
        <script src="../../../admin/dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>

     <script src="../js/jquery.min.js"></script>
      <script src="../js/bootstrap.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="../js/chart_custom_style1.js"></script>
      <script src="../js/custom.js"></script>
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
      
   </body>
</html>