<%@page import="table.annonce"%>
<%@page import="table.comptence"%>
<%@page import="table.informSuppl"%>
<%@page import="table.Objet_demandeI"%>
<%@page import="table.admin"%>
<%@page import="table.nosmetier"%>
<%@page import="table.sousTitre"%>
<%@page import="table.typeContrat"%>
<%@ page import="table.employeur" %>
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

    
    ResultSet AllTypCon = typeContrat.getAllTypeContrat(con);
    ResultSet res = nosmetier.getnosMetier(con); 
    ResultSet resann = nosmetier.getnosMetier(con); 
   
    ResultSet rescompt = nosmetier.getnosMetier(con);  
    ResultSet AllObjet = Objet_demandeI.getAllObjet_demandei(con);

    
    ResultSet AllNosMetier = nosmetier.getnosMetier(con);  
    ResultSet AllContrat = typeContrat.getAllTypeContrat(con);   
    ResultSet AllinformSuppl = informSuppl.getinformsuppl(con);  
    ResultSet Allcompetence_nosmet = comptence.AllCompetence_nosMet(con);  
    ResultSet AllAnnonce = annonce.getAllAnnEtNosMet(con);
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
      <!-- fontawesome-->
      <link rel="stylesheet" href="../dashbord/css/font-awesome.min.css">
        <!-- message css -->    	
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
                                        <form method="post" action="../../insertionObjet_DemandeI">
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Nouveau objet de la demande</h5>
                                                            <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                <i class="fa fa-close red_color"></i>
                                                            </span>
                                                        </div>
                                                        <div class="dash_head">
                                                            <h3><span><i class="fa fa-tag"></i> Objet de la demande </span></h3>
                                                        </div>
                                                        <div class="msg_list_main">
                                                            <div class="col-md-10">
                                                                <div class="mb-3">
                                                                    <label  class="form-label">Ajout Objet de la demande</label>
                                                                    <input type="text" class="form-control col-md-8"  name="objet_demandeI">
                                                                </div>
                                                                <div class="read_more">
                                                                    <div class="center">
                                                                        <input 
                                                                            type="button" 
                                                                            class="btn btn-success"
                                                                            data-bs-toggle="modal" 
                                                                            data-bs-target="#staticBackdrop" 
                                                                            onclick="validateForm()"
                                                                            value="Enregistrer">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Message Oui ou Non -->     
                                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                                            <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                <a href="annonce.jsp">
                                                                    <i class="fa fa-close red_color"></i>
                                                                </a>
                                                            </span>
                                                        </div>
                                                        <div class="modal-body">
                                                            <h4 class="modal-title" id="exampleModalLabel">�tes vous s�r d'enregistrer ?</h4>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <div class="accept">
                                                                <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                    <a href="annonce.jsp">
                                                                       <input class="btn btn-danger "value="Non" style="width: 47px;">
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <div class="accept">
                                                                <input class="btn btn-success " type="submit" value="Oui">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div> 
                                        </form>
                                        <!-- Button trigger modal -->
                                      <!-- module objet --> 
                                        <div>
                                            <div class="dash_head">
                                              <h3><span><i class="fa fa-tag"></i> Objet de la demande </span></h3>
                                            </div>
                                            
                                            <div class="col-md-10 mt-4">
                                                <img     
                                                    title="Ajout"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" 
                                                    data-bs-whatever=""
                                                    data-bs-toggle="tooltip"
                                                    data-bs-placement="bottom" 
                                                    src="../../images/ajout.png"
                                                    class="btn-accept1"
                                                >
                                            </div>
                                            
                                            <div class="col-md-10 mt-4">
                                                
                                                <table class="table " >
                                                    <thead>
                                                        <tr>
                                                           <th scope="col">Nom d'objet</th>
                                                           <th scope="col">Action</th>
                                                        </tr>
                                                     </thead>
                                                <% while (AllObjet.next()) { %>

                                                    <tbody>
                                                    <tr>
                                                        <td style="vertical-align: middle;">
                                                           <% out.println(AllObjet.getString("objet_demandeI")); %>
                                                        </td>

                                                        <td style="vertical-align: middle;">
                                                          <a href="modification/objet de la demande.jsp?id=<% out.println(AllObjet.getString("id_objetDemI")); %>">
                                                             
                                                             <div class="col-md-10 mt-4">
                                                                <img     
                                                                    title="Modifiation"
                                                                    data-bs-toggle="modal"
                                                                    data-bs-target="#ModalExempl" 
                                                                    data-bs-whatever=""
                                                                    data-bs-toggle="tooltip"
                                                                    data-bs-placement="bottom" 
                                                                    src="../../images/modifie.png"
                                                                    class="btn-accept1"
                                                                >
                                                            </div>
                                                          </a>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                               <%}%>
                                                </table>
                                            </div>
                                        </div>
                                      <!-- fin module objet -->

                                    </div>
                                </div>
                               
                           </div>
                        </div>
                      <!-- fin objet de la demande -->

                        <!-- nos metiers -->
                        <div class="tab-pane" id="metiers" role="tabpanel" aria-labelledby="metiers-tab">
                              <div>
                                  <div class="dash_head">
                                    <h3><span><i class="fa fa-tag"></i> Nos metiers </span></h3>
                                  </div>
                                    <div class="col-md-10 mt-4">
                                        <img     
                                            title="Ajout"
                                            data-bs-toggle="modal"
                                            data-bs-target="#nosmetier" 
                                            data-bs-whatever=""
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom" 
                                            src="../../images/ajout.png"
                                            class="btn-accept1"
                                        >
                                    </div>
                                  <div class="col-md-10 mt-4">
                                      <table class="table " >
                                        <thead>
                                            <tr>
                                               <th scope="col">Nom metiers</th>
                                               <th scope="col">Description</th>          
                                               <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                      <% while (AllNosMetier.next()) { %>

                                          <tbody>
                                          <tr>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllNosMetier.getString("nom_nosMet")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllNosMetier.getString("description_nosMet")); %>
                                              </td>

                                              <td style="vertical-align: middle;">
                                                <a href="modification/nos metier.jsp?id=<% out.println(AllNosMetier.getString("id_nosMet")); %>">
                                                   
                                                   <div class="col-md-10 mt-4">
                                                        <img     
                                                            title="Modifiation"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#ModalExempl" 
                                                            data-bs-whatever=""
                                                            data-bs-toggle="tooltip"
                                                            data-bs-placement="bottom" 
                                                            src="../../images/modifie.png"
                                                            class="btn-accept1"
                                                        >
                                                    </div>
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
                        <form class="job" action="../../estinsertJob" method="POST">
                            <div class="modal fade" id="nosmetier" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Nouveau metier</h5>
                                            <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <i class="fa fa-close red_color"></i>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <div class="msg_list_main">
                                                <div class="dash_head">
                                                   <h3><span><i class="fa fa-tags"></i> Nos metiers </span>
                                                   </h3>     
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="mb-3">
                                                          <label for="exampleFormControlInput1" class="form-label"> Nom </label>
                                                              <div class="mb-3">
                                                                 <input class=" form-control chps" type="text" name="nom_nosMet" required/>
                                                              </div>

                                                              <div class="form-group mb-3 ">
                                                                 <label for="exampleFormControlInput1" class="form-label">Description de metiers</label>
                                                                 <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="desc_nosMet" required ></textarea>
                                                              </div>

                                                                <div class="read_more">
                                                                    <div class="center">
                                                                        <input 
                                                                            type="button" 
                                                                            class="btn btn-success"
                                                                            data-bs-toggle="modal" 
                                                                            data-bs-target="#message" 
                                                                            onclick="validateForm()"
                                                                            value="Enregistrer">
                                                                    </div>
                                                                </div>
                                                          <!-- Button trigger modal -->
                                                    </div>                                             
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Message Oui ou Non -->     
                            <div class="modal fade" id="message" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                            <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <a href="annonce.jsp">
                                                    <i class="fa fa-close red_color"></i>
                                                </a>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <h4 class="modal-title" id="exampleModalLabel">étes vous sûr d'enregistrer ?</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="accept">
                                                <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    <a href="annonce.jsp" >
                                                       <input class="btn btn-danger "value="Non" style="width: 47px;">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="accept">
                                                <input class="btn btn-success " type="submit" value="Oui">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>  
                        </form>

                        <!-- fin Modal nos metier -->

                        <!-- type contrat -->
                        <div class="tab-pane" id="contrat" role="tabpanel" aria-labelledby="metiers-tab">
                              <div>
                                  <div class="dash_head">
                                    <h3><span><i class="fa fa-tag"></i> Type Contrat </span></h3>
                                  </div>
                                    <img     
                                        title="Ajout"
                                        data-bs-toggle="modal"
                                        data-bs-target="#typeContrat" 
                                        data-bs-whatever=""
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="bottom" 
                                        src="../../images/ajout.png"
                                        class="btn-accept1"
                                    >
                                  <div class="col-md-10 mt-4">
                                      <table class="table " >
                                          <thead>
                                     <tr>
                                        <th scope="col">Type contrat</th>
                                        <th scope="col">Action</th>

                                     </tr>
                                  </thead>
                                      <% while (AllContrat.next()) { %>

                                          <tbody>
                                          <tr>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllContrat.getString("type_Contrat")); %>
                                              </td>

                                              <td style="vertical-align: middle;">
                                                <a href="modification/type contrat.jsp?id=<% out.println(AllContrat.getString("id_typeContra")); %>">
                                                   <div class="col-md-10 mt-4">
                                                        <img     
                                                            title="Modifiation"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#ModalExempl" 
                                                            data-bs-whatever=""
                                                            data-bs-toggle="tooltip"
                                                            data-bs-placement="bottom" 
                                                            src="../../images/modifie.png"
                                                            class="btn-accept1"
                                                        >
                                                    </div>
                                                </a>
                                              </td>
                                          </tr>
                                      </tbody>
                                     <%}%>
                                      </table>
                                  </div>
                              </div>

                        </div>
                        <!-- Modal type contrat --> 
                        <form method="post" action="../../insertionTypeCon">

                            <div class="modal fade" id="typeContrat" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Nouveau type contrat</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <i class="fa fa-close red_color"></i>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <div class="msg_list_main">
                                                <div class="dash_head">
                                                   <h3><span><i class="fa fa-tags"></i> Type contrat </span>
                                                   </h3>     
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="mb-3">

                                                        <div class="mb-3">
                                                            <label  class="form-label">Ajout type de contrat</label>
                                                            <input type="text" class="form-control"  name="ajout_typeCont">
                                                        </div>

                                                        <div class="read_more">
                                                            <div class="center">
                                                                <input 
                                                                    type="button" 
                                                                    class="btn btn-success"
                                                                    data-bs-toggle="modal" 
                                                                    data-bs-target="#messageOui" 
                                                                    onclick="validateForm()"
                                                                    value="Enregistrer">
                                                            </div>
                                                        </div>
                                                    </div>                                             
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Message Oui ou Non -->     
                            <div class="modal fade" id="messageOui" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                            <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <a href="annonce.jsp">
                                                    <i class="fa fa-close red_color"></i>
                                                </a>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <h4 class="modal-title" id="exampleModalLabel">�tes vous s�r d'enregistrer ?</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="accept">
                                                <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    <a href="annonce.jsp" >
                                                       <input class="btn btn-danger "value="Non" style="width: 47px;">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="accept">
                                                <input class="btn btn-success " type="submit" value="Oui">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </form>

                        <!-- fin type contrat -->

                        <!-- information supplementaire -->
                        <div class="tab-pane" id="Information" role="tabpanel" aria-labelledby="metiers-tab">
                              <div>
                                  <div class="dash_head">
                                    <h3><span><i class="fa fa-tag"></i> Information supplementaire </span></h3>
                                  </div>
                                  <div class="col-md-10 mt-4">
                                        <img     
                                            title="Ajout"
                                            data-bs-toggle="modal"
                                            data-bs-target="#infoSupp" 
                                            data-bs-whatever=""
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom" 
                                            src="../../images/ajout.png"
                                            class="btn-accept1"
                                        >
                                    </div>
                                  <div class="col-md-10 mt-4">
                                      <table class="table " >
                                          <thead>
                                     <tr>
                                          <th scope="col">Metier</th> 
                                          <th scope="col">Salaire</th> 
                                          <th scope="col">Heures</th>
                                          <th scope="col">Type contrat</th>

                                          <th scope="col">Action</th>

                                     </tr>
                                  </thead>
                                      <% while (AllinformSuppl.next()) { %>

                                          <tbody>
                                          <tr>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllinformSuppl.getString("nom_nosmet")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllinformSuppl.getString("salaire")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllinformSuppl.getString("horairTrav")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(AllinformSuppl.getString("type_Contrat")); %>
                                              </td>

                                              <td style="vertical-align: middle;">
                                                <a href="modification/information suppl.jsp?id=<% out.println(AllinformSuppl.getString("id_nosMet")); %>">
                                                   <div class="col-md-10 mt-4">
                                                        <img     
                                                            title="Modifiation"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#ModalExempl" 
                                                            data-bs-whatever=""
                                                            data-bs-toggle="tooltip"
                                                            data-bs-placement="bottom" 
                                                            src="../../images/modifie.png"
                                                            class="btn-accept1"
                                                        >
                                                    </div>
                                                </a>
                                              </td>
                                          </tr>
                                      </tbody>
                                     <%}%>
                                      </table>
                                  </div>
                              </div>

                        </div>
                        <!-- Modal information supplementaire --> 
                        <form action="../../informSuppl" method="POST" >
                            <div class="modal fade" id="infoSupp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Nouveau information supplementaire</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <i class="fa fa-close red_color"></i>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <div class="msg_list_main">
                                                <div class="dash_head">
                                                   <h3><span><i class="fa fa-tags"></i> Information supplementaire </span>
                                                   </h3>     
                                                </div>
                                                <div class="col-md-10">
                                                    <div class="mb-3">
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
                                                            <div class="center">
                                                                <input 
                                                                    type="button" 
                                                                    class="btn btn-success"
                                                                    data-bs-toggle="modal" 
                                                                    data-bs-target="#messageSuppl" 
                                                                    onclick="validateForm()"
                                                                    value="Enregistrer">
                                                            </div>
                                                        </div> 
                                                    </div>                                             
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                          </div>
                           <!-- Message Oui ou Non -->     
                            <div class="modal fade" id="messageSuppl" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                            <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <a href="annonce.jsp">
                                                    <i class="fa fa-close red_color"></i>
                                                </a>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <h4 class="modal-title" id="exampleModalLabel">étes vous sûr d'enregistrer ?</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="accept">
                                                <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    <a href="annonce.jsp" >
                                                       <input class="btn btn-danger "value="Non" style="width: 47px;">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="accept">
                                                <input class="btn btn-success " type="submit" value="Oui">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </form> 
               
                        <!-- fin information supplementaire -->

                        <!-- competence -->
                          <div class="tab-pane" id="Competence" role="tabpanel" aria-labelledby="metiers-tab">
                              <div>
                                  <div class="dash_head">
                                    <h3><span><i class="fa fa-tag"></i> Competence </span></h3>
                                  </div>
                                  <div class="col-md-10 mt-4">
                                        <img     
                                            title="Ajout"
                                            data-bs-toggle="modal"
                                            data-bs-target="#competence" 
                                            data-bs-whatever=""
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom" 
                                            src="../../images/ajout.png"
                                            class="btn-accept1"
                                        >
                                    </div>
                                  <div class="col-md-10 mt-4">
                                      
                                      <table class="table " >
                                          <thead>
                                     <tr>
                                        <th scope="col">Nos metiers</th>  
                                        <th scope="col">Competence</th> 
                                        <th scope="col">Description</th>
                                        <th scope="col">Action</th>

                                     </tr>
                                  </thead>
                                      <% while (Allcompetence_nosmet.next()) { %>

                                          <tbody>
                                          <tr>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(Allcompetence_nosmet.getString("nom_nosMet")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(Allcompetence_nosmet.getString("competence")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                 <% out.println(Allcompetence_nosmet.getString("description_nosMet")); %>
                                              </td>
                                              <td style="vertical-align: middle;">
                                                <a href="modification/competence.jsp?id=<% out.println(Allcompetence_nosmet.getString("id_compet")); %>">
                                                   <div class="col-md-10 mt-4">
                                                        <img     
                                                            title="Modifiation"
                                                            data-bs-toggle="modal"
                                                            data-bs-target="#ModalExempl" 
                                                            data-bs-whatever=""
                                                            data-bs-toggle="tooltip"
                                                            data-bs-placement="bottom" 
                                                            src="../../images/modifie.png"
                                                            class="btn-accept1"
                                                        >
                                                    </div>
                                                </a>
                                              </td>
                                          </tr>
                                      </tbody>
                                     <%}%>
                                      </table>
                                  </div>
                              </div>

                        </div>
                        <!-- Modal competence --> 
                        <form method="post" action="../../insertionCompt" >

                            <div class="modal fade" id="competence" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <h5 class="modal-title" id="exampleModalLabel">Nouvelle competence du metier</h5>
                                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                              <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                  <i class="fa fa-close red_color"></i>
                                              </span>
                                          </div>
                                          <div class="modal-body">
                                              <div class="msg_list_main">
                                                  <div class="dash_head">
                                                     <h3><span><i class="fa fa-tags"></i>Competence </span>
                                                     </h3>     
                                                  </div>
                                                  <div class="col-md-10">
                                                      <div class="mb-3">

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
                                                               <div class="center">
                                                                   <input 
                                                                       type="button" 
                                                                       class="btn btn-success"
                                                                       data-bs-toggle="modal" 
                                                                       data-bs-target="#messageComp" 
                                                                       onclick="validateForm()"
                                                                       value="Enregistrer">
                                                               </div>
                                                           </div>
                                                      </div>                                             
                                                  </div>
                                              </div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                             <!-- Message Oui ou Non -->     
                            <div class="modal fade" id="messageComp" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                            <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                <a href="annonce.jsp">
                                                    <i class="fa fa-close red_color"></i>
                                                </a>
                                            </span>
                                        </div>
                                        <div class="modal-body">
                                            <h4 class="modal-title" id="exampleModalLabel">étes vous sûr d'enregistrer ?</h4>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="accept">
                                                <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    <a href="annonce.jsp" >
                                                       <input class="btn btn-danger "value="Non" style="width: 47px;">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="accept">
                                                <input class="btn btn-success " type="submit" value="Oui">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- fin competence -->
                        
                        <!-- annonce -->
                         <div class="tab-pane" id="Annonce" role="tabpanel" aria-labelledby="metiers-tab">
                                <div>
                                    <div class="dash_head">
                                      <h3><span><i class="fa fa-tag"></i> Annonce </span></h3>

                                    </div>
                                    <div class="col-md-10 mt-4">
                                        <img     
                                            title="Ajout"
                                            data-bs-toggle="modal"
                                            data-bs-target="#annonce" 
                                            data-bs-whatever=""
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom" 
                                            src="../../images/ajout.png"
                                            class="btn-accept1"
                                        >
                                    </div>
                                    <div class="col-md-10 mt-4">
                                        
                                        <div class="col-sm-8">                     
                                            <div class="input-group mb-3 col-lg-4" style="float: inline-end;">
                                                <input placeholder="Recherche" type="text" id="searchCode" name="recherche" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                            </div>
                                        </div>
                                        
                                        <table class="table" >
                                            <thead>
                                               <tr>
                                                    <th scope="col">Nos metiers</th>
                                                    <th scope="col">Annonce</th>  
                                                    <th scope="col">Type Annonce</th>    
                                                    <th scope="col">Action</th>
                                               </tr>
                                            </thead>
                                        <% while (AllAnnonce.next()) { %>

                                            <tbody>
                                                <tr>
                                                    <td style="vertical-align: middle;">
                                                       <% out.println(AllAnnonce.getString("nom_nosMet")); %>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                       <% out.println(AllAnnonce.getString("annonce")); %>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                       <% out.println(AllAnnonce.getString("typeAnn")); %>
                                                    </td>
                                                    <td style="vertical-align: middle;">
                                                      <a href="modification/annonce.jsp?id=<% out.println(AllAnnonce.getString("id_ann")); %>">
                                                        <div class="col-md-10 mt-4">
                                                            <img     
                                                                title="Modifiation"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#ModalExempl" 
                                                                data-bs-whatever=""
                                                                data-bs-toggle="tooltip"
                                                                data-bs-placement="bottom" 
                                                                src="../../images/modifie.png"
                                                                class="btn-accept1"
                                                            >
                                                        </div>
                                                      </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                       <%}%>
                                        </table>
                                    </div>
                                </div>
                          </div>                                       
                          <!-- Modal annonce --> 
                            <form class="job" action="../../insertionAnnonce" method="POST">
                                <div class="modal fade" id="annonce" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Nouvelle annonce</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    <i class="fa fa-close red_color"></i>
                                                </span>
                                            </div>
                                            <div class="modal-body">
                                                <div class="msg_list_main">
                                                    <div class="dash_head">
                                                       <h3><span><i class="fa fa-tags"></i> annonce </span>
                                                       </h3>     
                                                    </div>
                                                    <div class="col-md-10">
                                                        <div class="mb-3">

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

                                                            
                                                            <div class="form-check">
                                                              <input class="form-check-input" type="checkbox" name="typeAnn" id="flexCheckChecked"  value="Employ�">
                                                              <label class="form-check-label" for="flexCheckChecked">
                                                                Travailleur
                                                              </label>
                                                            </div>
                                                            <div class="form-check">
                                                              <input class="form-check-input" type="checkbox" name="typeAnn" id="flexCheckDefault" checked value="Visiteur">
                                                              <label class="form-check-label" for="flexCheckDefault">
                                                                visiteur
                                                              </label>
                                                            </div>
                                                    
                                                          

                                                        <div class="read_more">
                                                            <div class="center">
                                                                <input 
                                                                    type="button" 
                                                                    class="btn btn-success"
                                                                    data-bs-toggle="modal" 
                                                                    data-bs-target="#messageAnn" 
                                                                    onclick="validateForm()"
                                                                    value="Enregistrer">
                                                            </div>
                                                        </div>

                                                        </div>                                             
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Message Oui ou Non -->     
                                <div class="modal fade" id="messageAnn" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                                <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                    <a href="annonce.jsp">
                                                        <i class="fa fa-close red_color"></i>
                                                    </a>
                                                </span>
                                            </div>
                                            <div class="modal-body">
                                                <h4 class="modal-title" id="exampleModalLabel">�tes vous s�r d'enregistrer ?</h4>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="accept">
                                                    <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                        <a href="annonce.jsp" >
                                                           <input class="btn btn-danger "value="Non" style="width: 47px;">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="accept">
                                                    <input class="btn btn-success " type="submit" value="Oui">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                                                     
                    </div>
                    </div>
               <!-- end dashboard inner -->
                </div>
            </div>
        </div>
    <!-- JS pour la message OUI ou NON -->                                                                   
    <script>
        const searchInput = document.getElementById("searchCode");     
        const error = document.getElementById("msg-error");  


        const rows = document.querySelectorAll('.table tbody tr');
        

        searchInput.addEventListener('keyup', function(event) {
            const searchString = event.target.value.toLowerCase();
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
               
                if (text.includes(searchString)) {
                    
                    row.style.display = 'table-row';  
                    error.style.display = 'none';

                }else {
                    row.style.display = 'none';  
                    error.style.display = 'inline';

                } 
            });
       
        });
    </script>                                
      <!-- jQuery -->
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
         var ps = new PerfectScrollbar('#sidebar');
      </script>
 
      <script src="bootstrap V5/js/bootstrap.bundle.min.js"></script>
      <script>
      var firstTabEl = document.querySelector('#myTab li:last-child a')
      var firstTab = new bootstrap.Tab(firstTabEl)

      firstTab.show()
      </script>
      
          <!--  objet de la demande js -->
    <script>
        var exampleModal = document.getElementById('messageAnn')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
    <script>
        var exampleModal = document.getElementById('messageComp')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
    <script>
        var exampleModal = document.getElementById('messageSuppl')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
    <script>
        var exampleModal = document.getElementById('message')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
    <script>
        var exampleModal = document.getElementById('messageOui')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
    <script>
        var exampleModal = document.getElementById('exampleModal')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau objet de la demande ' 
        })
    </script> 
    <script>
        var exampleModal = document.getElementById('Modal1')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
    <script>
        var exampleModal = document.getElementById('staticBackdrop')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>

    
          <!--  nos metiersjs -->
    <script>
        var exampleModal = document.getElementById('nosmetier')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau metier ' 
        })
    </script> 
              <!--  message OUI ou NON -->
    <script>
        var exampleModal = document.getElementById('static1')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>
              <!--  type contrat --> 
    <script>
        var exampleModal = document.getElementById('typeContrat')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau type contrat' 
        })
    </script> 
                  <!--  type information supplementaire --> 
    <script>
        var exampleModal = document.getElementById('infoSupp')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau information supplemenataire' 
        })
    </script> 
                      <!--  type competence --> 
    <script>
        var exampleModal = document.getElementById('competence')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau competence de la metier' 
        })
    </script> 
                          <!--  type annpnce --> 
    <script>
        var exampleModal = document.getElementById('annonce')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau competence de la metier' 
        })
    </script> 
        <script>
        var exampleModal = document.getElementById('exampleModal1')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Nouveau competence de la metier' 
        })
    </script> 
        
        <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            if (message == 1) {
              // Afficher la notification de succ�s avec Swal.fire()
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