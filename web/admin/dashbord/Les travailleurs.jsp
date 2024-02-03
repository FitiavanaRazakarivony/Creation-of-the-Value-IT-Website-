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
    session.removeAttribute("email");

    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    ResultSet AllSex = sexe.getAllSex(con); 
    ResultSet resann = nosmetier.getnosMetier(con); 
    ResultSet AllVisiteur = employeur.getAllVisiteur(con); 
    ResultSet AllIdVisiteur = employeur.getIdAllVisiteur(request.getParameter("id"),con);
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

                <div class="row column_title">
                   <div class="col-md-12">
                      <div class="page_title">
                         <h2>Les travailleurs</h2> 
                      </div>
                   </div>
                </div>  

                <div class="card" style="padding: 16px;">
                   <form>
                      <div class="container" style="margin-top: 40px;margin-bottom: 16px;">
                       
                          <div class="row">
                            
                            <div class="col-md-10 mt-4">
                                <img     
                                    title="Ajout"
                                    data-bs-toggle="modal"
                                    data-bs-target="#exampleModal" 
                                    data-bs-whatever=""
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="bottom" 
                                    src="../../images/ajouter.png"
                                    class="btn-Modif"
                                >
                            </div>
                            
                            <div class="col-sm-8">                     
                                <div class="input-group mb-3 col-lg-4" style="float: inline-end;">
                                    <input placeholder="Recherche" type="text" id="searchCode" name="recherche" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
                                </div>
                            </div>
                          </div>
                           
                        </div>
                   </form>

                            
                   <table class="table" >
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
                         <% while (AllVisiteur.next()) { %>

                        <tbody>

                           <tr>

                              <td style="vertical-align: middle;">
                                 <% out.println(AllVisiteur.getString("nom_visit")); %>
                              </td>
                              <td style="vertical-align: middle;">
                                 <% out.println(AllVisiteur.getString("prenom_visit")); %>
                              </td>
                              <td style="vertical-align: middle;">
                                 <% out.println(AllVisiteur.getString("email_visit")); %>
                              </td>
                              <td style="vertical-align: middle;">                               
                                 <% out.println(AllVisiteur.getString("nom_nosMet")); %>
                              </td>
                              <td style="vertical-align: middle;">
                                 <% out.println(AllVisiteur.getString("sexe")); %>
                              </td>
                              <td style="vertical-align: middle;">
                                <a href="modification.jsp?id=<% out.println(AllVisiteur.getString("id_visit")); %>">
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
               <!-- end contact -->            

                <!-- Ajout employe MODAL -->
            <form id="monFormulaire" class="row g-3 needs-validation" action="../../insertionTrav" method="POST" enctype="multipart/form-data" novalidate>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Nouveau Employe</h5>
                          <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                           <i class="fa fa-close red_color"></i>
                          </span>
                        </div>
                        <div class="modal-body">
                                <input type="hidden" class="form-control" id="" name="id_eurex" required>

                              <div class="col-lg-12 mt-4" >
                                <label for="formFile validationCustom03" class="form-label">choisir le photo de profil</label>
                                <input class="form-control" type="file" name="file" id="image" required>
                                 <span id="image-error" style="display: none; color:red;">Choisisier le photo de profile!.</span>
                             </div>

                             <div class="col-md-12">
                                <label for="validationCustom02" class="form-label">Pseudo</label>
                                <input type="text" class="form-control" id="pseudo" name="pseudo" required>    

                                <span id="pseudo-error" style="display: none; color:red;">Votre pseudo est invalide!.</span>
                             </div>

                             <div class="col-md-12">
                                <label for="validationCustom01" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="nom" name="nom_empl" value="" required>                              
                                <span id="nom-error" style="display: none; color:red;">Veuillez entrer votre nom!.</span>

                             </div>
                             <div class="col-md-12">
                                <label for="validationCustom02" class="form-label">Prenom</label>
                                <input type="text" class="form-control" id="prenom" name="prenom_empl" required>
                                <span id="prenom-error" style="display: none; color:red;">Veuillez entrer votre prenom!.</span>
                             </div>

                             <div class="col-md-12">
                                <label for="exampleFormControlInput1" class="form-label">Tel</label>
                                <input type="text" class="form-control" id="phone" maxlength="10" name="tel_empl" >                                           
                                <span id="phone-error" style="display: none; color:red;">Veuillez entrer un numero de telephone valide.</span>
                              </div>

                                <div class="col-md-12 mt-3">
                                    <label for="validationCustom02" class="form-label">Mot de passe</label>
                                    <input type="text" class="form-control" id="mdp" name="mdp_empl" required>
                                    <span id="mdp-error" style="display: none; color:red;">Le mot de pass doit etre en 8 chiffres ou lettres!.</span>
                                </div>
                                
                            <div class="col-md-12">
                                <label for="validationCustomUsername" class="form-label">email</label>
                                <div class="input-group has-validation">
                                   <span class="input-group-text" id="inputGroupPrepend">@</span>
                                   <input type="email" class="form-control" id="email" name="email_empl" aria-describedby="inputGroupPrepend" required>
                                </div>   
                                    <span id="email-error" style="display: none; color:red;">Veuillez entrer un email valide!.</span>
                            </div>


                             <div class="col-md-12">
                                 <label for="validationCustom03" class="form-label">adresse</label>
                                 <input type="text" class="form-control" id="adresse" name="adress_empl" required>
                                 <span id="adresse-error" style="display: none; color:red;">Entrer l'adresse postale!.</span>
                             </div>

                             <div class="col-md-6">
                                <label  for="validationCustom04" class="form-label">sexe</label>
                                <select name="id_sexe" class="form-select col-md-8" id="sexe" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example" required>
                                   <option selected disabled value="">Choisir...</option>
                                   <option>
                                   <% while (AllSex.next()) { %>
                                      <option value="<% out.println(AllSex.getString("id_sexe")); %>">
                                         <% out.println(AllSex.getString("sexe")); %>
                                      </option>
                                   <% }%>
                                   </option>
                                </select>
                                 <span id="sexe-error" style="display: none; color:red;">Choisisier le sexe!.</span>
                             </div>
                             <div class="col-md-6">
                                <label  for="validationCustom04" class="form-label">metier</label>
                                 <select name="id_nosMet" class="form-select col-md-8" id="metier" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example" required>
                                       <option selected disabled value="">Choisir...</option>
                                       <option>
                                          <% while (resann.next()) { %>
                                             <option value="<% out.println(resann.getString("id_nosMet")); %>">
                                                   <% out.println(resann.getString("nom_nosMet")); %>
                                             </option>
                                          <% }%>
                                       </option>
                                 </select>
                                 <span id="metier-error" style="display: none; color:red;">Choisisier le metier!.</span>
                             </div>


                                <div class="form-check mt-3">
                                    <div class="form-check col-md-4"> 
                                       <input class="form-check-input" type="radio" name="type" value="Admin" checked>
                                       <label class="form-check-label" for="flexRadioDefault1">
                                          Admin
                                       </label>
                                    </div>

                                    <div class="form-check">
                                       <input class="form-check-input" type="radio" name="type" value="Travailleur" checked>
                                       <label class="form-check-label" for="flexRadioDefault2">
                                          Travailleur
                                       </label>
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
                            </div>
                        </div>
                    </div>
                </div>

                 <!-- Message Oui ou Non -->     
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Acc�ptation</h5>
                        </div>
                        <div class="modal-body">
                            <h4 class="modal-title" id="exampleModalLabel">�tes vous s�r d'enregistrer ?</h4>

                            <div class="mt-4" style="display: flex;column-gaprow-gap: 4px;justify-content: end;column-gap: 22px;">
                                <div class="accept">
                                    <input class="btn btn-success " type="submit" value="Oui">
                                </div>
                                <div class="accept">
                                    <span class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                        <div class="btn btn-danger "> NON </div>
                                    </span>
                                </div>
                                
                            </div>
                        </div>
                      </div>
                    </div>
                </div>
            </form>

            <!--  MODALS modification-->    

               <div class="center">
                   <span id="msg-error" class="" style="display: none;"></span>
               </div>  <!--  fin MODALS modification-->

            </div>
        </div>      
      </div>
        <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>  
        <script src="js/js_erreur/jsError.js"></script>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
                <!-- custom js -->
        <script src="js/chart_custom_style1.js"></script>
        <script src="js/custom.js"></script>
    <script >
        var exampleModal = document.getElementById('exampleModal1')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Acc�ptation' 
        })
    </script>                                    
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

        <script>
           var ps = new PerfectScrollbar('#sidebar');
        </script>

        <script >
           var exampleModal = document.getElementById('exampleModal')
           exampleModal.addEventListener('show.bs.modal', function (event) {
           var button = event.relatedTarget
           var modalTitle = exampleModal.querySelector('.modal-title')
           var modalBodyInput = exampleModal.querySelector('.modal-body input')
           modalTitle.textContent = 'Nouveau employe ' 
           })
        </script>     
            

   </body>
</html>