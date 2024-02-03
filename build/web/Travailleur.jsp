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

    
    //ResultSet res = sousTitre.getAllsousTitre(con);
    ResultSet AllSex = sexe.getAllSex(con); 
    ResultSet res = nosmetier.getnosMetier(con); 
    ResultSet resann = nosmetier.getnosMetier(con); 
    ResultSet reslist = nosmetier.getnosMetier(con); 
    ResultSet AllVisiteur = employeur.getAllVisiteur(con);  

   // ResultSet getIdVisit = employeur.getIdAllVisiteur(request.getParameter("id_visit"),con);  
   // ResultSet getRecherNosMet = employeur.getAllnosMetRecher(request.getParameter("nom_nosmet"), con);
 
 
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
      <title>Value-IT - agent </title>
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
                                 <h2>Ajout employeur</h2>
                              </div>
                           </div>
                        </div>

                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                           <li class="nav-item" role="presentation">
                              <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">employer</button>
                           </li>
                           <li class="nav-item" role="presentation">
                              <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Sex</button>
                           </li>
                           <li class="nav-item" role="presentation">
                              <button class="nav-link" id="settings-tab" data-bs-toggle="tab" data-bs-target="#settings" type="button" role="tab" aria-controls="settings" aria-selected="false">Nos metier</button>
                           </li>
                        </ul>

                        <div class="tab-content">
                           <div class="tab-pane active" id="home" role="tabpanel" aria-labelledby="home-tab">
                              <%-- ajout employer --%>
                              <div class="col-md-12">
                                 <div class="dash_blog">
                                    <div class="dash_blog_inner">
                                          <div class="dash_head">
                                             <h3><span><i class="fa fa-tag"></i> Ajout employeur</span></h3>
                                          </div>
                                       
                                          <div class="msg_list_main">
                                          <div class="col-md-12">
                                             <div class="card-body">

                                                <form id="monFormulaire" class="row g-3 needs-validation" action="../../insertionEmpl" method="POST" enctype="multipart/form-data" novalidate>
                                                   
                                                   <div class="col-md-4">
                                                      <label for="validationCustom02" class="form-label">Pseudo</label>
                                                      <input type="text" class="form-control" id="validationCustom02" name="pseudo" required>
                                                      <div class="valid-feedback">
                                                         Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a first name.
                                                      </div>
                                                   </div>
                                                   
                                                   
                                                   <div class="col-md-4">
                                                      <label for="validationCustom01" class="form-label">Nom</label>
                                                      <input type="text" class="form-control" id="validationCustom01" name="nom_empl" value="" required>
                                                      <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a name.
                                                   </div>

                                                   </div>
                                                   <div class="col-md-4">
                                                      <label for="validationCustom02" class="form-label">Prenom</label>
                                                      <input type="text" class="form-control" id="validationCustom02" name="prenom_empl" required>
                                                      <div class="valid-feedback">
                                                         Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a first name.
                                                      </div>
                                                   </div>
                                                   
                                                   
                                                   <div class="col-md-4">
                                                      <label for="validationCustom02" class="form-label">tel</label>
                                                      <input type="text" class="form-control" id="tel" name="tel_empl" maxlength="10" required>
                                                      <span id="phone-error" style="display: none; color:red;">Veuillez entrer un email valide.</span>
                                                      <div class="valid-feedback">
                                                         Looks good!
                                                         </div>
                                                         <div class="invalid-feedback">
                                                         Please select a tel.
                                                      </div>
                                                      </div>
                                                   
                                                      <div class="col-md-4">
                                                      <label for="validationCustom02" class="form-label">Mot de passe</label>
                                                      <input type="text" class="form-control" id="validationCustom02" name="mdp_empl" required>
                                                      <div class="valid-feedback">
                                                         Looks good!
                                                         </div>
                                                         <div class="invalid-feedback">
                                                         Please select a password.
                                                      </div>
                                                      </div>
                                                
                                                      <div class="col-md-4">
                                                      <label for="validationCustomUsername" class="form-label">email</label>
                                                      <div class="input-group has-validation">
                                                         <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                         <input type="email" class="form-control" id="email" name="email_empl" aria-describedby="inputGroupPrepend" required>
                                                         <span id="email-error" style="display: none; color:red;">Veuillez entrer un email valide.</span>

                                                         <div class="valid-feedback">
                                                         Looks good!
                                                         </div>
                                                         <div class="invalid-feedback">
                                                         Please select a email.
                                                      </div>
                                                      </div> 
                                                   </div>
                                                   
                                                   <div class="col-md-4">
                                                      <label for="validationCustom03" class="form-label">adresse</label>
                                                      <input type="text" class="form-control" id="validationCustom03"   name="adress_empl" required>
                                                      <div class="valid-feedback">
                                                         Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a adresse.
                                                      </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                      <label  for="validationCustom04" class="form-label">sexe</label>
                                                      <select name="id_sexe" class="form-select col-md-6" id="validationCustom04" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example" required>
                                                         <option selected disabled value="">Choose...</option>
                                                         <option>
                                                         <% while (AllSex.next()) { %>
                                                            <option value="<% out.println(AllSex.getString("id_sexe")); %>">
                                                               <% out.println(AllSex.getString("sexe")); %>
                                                            </option>
                                                         <% }%>
                                                         </option>
                                                      </select>
                                                      <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a sexe.
                                                   </div>
                                                   </div>
                                                   <div class="col-md-4">
                                                      <label  for="validationCustom04" class="form-label">metier</label>
                                                      <select name="id_nosMet" class="form-select col-md-6" id="validationCustom04" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example" required>
                                                         <option selected disabled value="">Choose...</option>
                                                         <option>
                                                            <% while (resann.next()) { %>
                                                               <option value="<% out.println(resann.getString("id_nosMet")); %>">
                                                                     <% out.println(resann.getString("nom_nosMet")); %>
                                                               </option>
                                                            <% }%>
                                                         </option>
                                                      </select>
                                                      <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a sexe.
                                                   </div>
                                                   </div>
                                                   <div class="col-lg-4">
                                                      <label for="formFile validationCustom03" class="form-label">choisir le photo de profil</label>
                                                      <input class="form-control" type="file" name="file" id="formFile validationCustom03" required>
                                                   </div>
                                                   <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select your profil.
                                                   </div>

                                                   <div class="form-check mt-3">
                                                      <div class="form-check col-md-4"> 
                                                         <input class="form-check-input" type="radio" name="type" value="Travailleur" checked>
                                                         <label class="form-check-label" for="flexRadioDefault1">
                                                            Travailleur
                                                         </label>
                                                      </div>
                                                   
                                                      <div class="form-check">
                                                         <input class="form-check-input" type="radio" name="type" value="Admin" checked>
                                                         <label class="form-check-label" for="flexRadioDefault2">
                                                            Admin
                                                         </label>
                                                      </div>
                                                   </div>

                                                      <div class="read_more">
                                                         <div class="center"><input class="btn btn-success " onclick="validateForm()" type="submit" value="Enregistrer">
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
                           <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                                                     <%-- ajout sexe --%>
                              <div class="col-md-12">
                                 <div class="dash_blog">
                                    <div class="dash_blog_inner">
                                          <div class="dash_head">
                                             <h3><span><i class="fa fa-tag"></i> Ajout sexe</span></h3>
                                          </div>
                                       
                                          <div class="msg_list_main">
                                          <div class="col-md-12">
                                             <div class="card-body">
                                                <%-- example --%>

                                                <form class="row g-3 needs-validation" action="../../insertSexServlet" method="POST" novalidate>
                                                   <div class="col-md-4">
                                                      <label for="validationCustom01" class="form-label">Sexe</label>
                                                      <input type="text" class="form-control" id="validationCustom01" name="ajout_sexe" value="" required>
                                                      <div class="valid-feedback">
                                                      Looks good!
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Please select a name.
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
                           </div>
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
      <script src="js/js_navs&bar/js_navs.js"></script>
      
      <script>
         (function () {
            'use strict'
         
            var forms = document.querySelectorAll('.needs-validation')
         
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
    <script>
        function validateForm() {
    // test si vide nomComplet
    var input = document.getElementById("nomComplet");
    var value = input.value.trim();

    if (value.length === 0) {
        champVidenomComplet.style.display = "inline";
        input.style.border = "1px solid red";
    } else {
        champVidenomComplet.style.display = "none";
        input.style.border = "1px solid #ccc";
    }
    // test si vide username
    var input = document.getElementById("username");
    var value = input.value.trim();

    if (value.length === 0) {
        champVideusername.style.display = "inline";
        input.style.border = "1px solid red";
    } else {
        champVideusername.style.display = "none";
        input.style.border = "1px solid #ccc";
    }
    // test si vide Adresse
    var input = document.getElementById("Adresse");
    var value = input.value.trim();

    if (value.length === 0) {
        champVideAdresse.style.display = "inline";
        input.style.border = "1px solid red";
    } else {
        champVideAdresse.style.display = "none";
        input.style.border = "1px solid #ccc";
    }

    // email error
    var emailInput = document.getElementById("email");
    var emailError = document.getElementById("email-error");
    var emailPattern = /([^.@]+)(\.[^.@]+)*@([^.@]+\.)+([^.@]+)/;
    var emailValue = emailInput.value;
    if (!emailPattern.test(emailValue)) {
        emailError.style.display = "inline";
        emailInput.style.border = "1px solid red";
        emailInput.value = "";
        return false;
      } else {
        emailError.style.display = "none";
        emailInput.style.border = "1px solid #ccc";
        emailInput.value = emailValue;
      }

      // telephone error

    //mdp error
    var mdpInput = document.getElementById("motDePasse");
    var mdpPattern = /^(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    var mdpError = document.getElementById("mdp-error");
    
    var mdpValue = mdpInput.value;
    
    if (!mdpPattern.test(mdpValue)) {
        mdpError.style.display = "inline";
        mdpInput.style.border = "1px solid red";
        mdpInput.value = "";
      return false;
    } else {
        mdpError.style.display = "none";
        mdpInput.style.border = "1px solid #ccc";
      mdpInput.value = mdpValue;
    }
    return true;
      //  tel
    var champ = document.getElementById("tel"); // R�cup�rer le champ de saisie

      var valeur = champ.value;
      var estValide = /^\d{3} \d{2} \d{3} \d{2}$/.test(valeur);

      if (!estValide) {
        event.preventDefault(); // Emp�cher l'envoi du formulaire
        alert("Veuillez saisir 16 chiffres avec un espace apr�s chaque groupe de chiffres !");
      }
  }
    </script>
   </body>
     
 <%-- Premier lettre doit etre en majuscule --%>
   
     <script>
    var formulaire = document.getElementById("monFormulaire"); // R�cup�rer le formulaire
    var champ = document.getElementById("votreChamp"); // R�cup�rer le champ de saisie

    formulaire.addEventListener("submit", function(event) {
      var valeur = champ.value;
      var premiereLettre = valeur.charAt(0);

      if (premiereLettre !== premiereLettre.toUpperCase()) {
        event.preventDefault(); // Emp�cher l'envoi du formulaire
        alert("La premi�re lettre doit �tre en majuscule !");
      }
    });
  </script>
  
  <%-- Tous lettre doit etre en majuscule --%>
    <script>
    var formulaire = document.getElementById("monFormulaire"); // R�cup�rer le id de la formulaire
    var champ = document.getElementById("votreChamp"); // R�cup�rer le id de la champ de saisie

    formulaire.addEventListener("submit", function(event) {
      var valeur = champ.value;
      var estToutMajuscules = /^[A-Z]+$/.test(valeur);

      if (!estToutMajuscules) {
        event.preventDefault(); // Emp�cher l'envoi du formulaire
        alert("Toutes les lettres doivent �tre en majuscules !");
      }
    });
  </script>
</html>