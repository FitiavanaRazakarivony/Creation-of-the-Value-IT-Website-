
<%@page import="table.demande_demI"%>
<%@page import="table.demande_demE"%>
<%@ include file="base.jsp" %>

<%@page import="table.Objet_demandeI"%>
<%@ page import="table.employeur" %>

<%@ page import="table.annonce" %>
<%@ page import="table.sexe" %>
<%@ page import="table.demandeurExt" %>

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_visit= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet V_res = employeur.afficher(email_visit,con);  

    ResultSet Vres = employeur.afficher(email_visit,con);  

    ResultSet AllAnonce = annonce.getAllAnnonce(con); 
    
    ResultSet getIdAnn = annonce.getIdAnn(request.getParameter("id_ann"),con);   
    ResultSet getIdann_compt = annonce.getIdAnn_compet(request.getParameter("id_ann"),con);  

    
    ResultSet getIdann_compt_typeCont = annonce.getIdAn_TypeCont(request.getParameter("id_ann"),con);    

    ResultSet AllAnonceEtNosMet = annonce.getAnnEtNosMetId(request.getParameter("id_ann"),con);

    ResultSet AnonceEtNosMet = annonce.getAnnEtNosMet(con);    
    ResultSet getAnonceEtNosMet = annonce.getAnnEtNosMet(con);
    ResultSet AllSex = sexe.getAllSex(con);       
    ResultSet AllObjetDem = Objet_demandeI.getAllObjet_demandei(con);     
    
    ResultSet demandExt = demandeurExt.getDemandeurExterne(con);    
    ResultSet AllContenu = demande_demI.getAfficheDemObj(con);   
    ResultSet AllContenuEx = demande_demE.getAfficheDemObjEx(con);

%>


<!DOCTYPE html>
<html>
    <head>
    <title>Value-IT - Postuler</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/style.css">  
    <link rel="stylesheet" href="../css/style1.css">  
    <!-- message css -->    	
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    </head>
<body>
    <section class="ftco-cover overlay" style="background-image: url(../images/image_4.jpg);" id="section-home" data-aos="fade"  data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center justify-content-center ftco-vh-100">
          <div class="col-md-9 text-center">
            <h1 class="ftco-heading mb-4" data-aos="fade-up" data-aos-delay="500">Description d'emploi</h1>
            <h2 class="h5 ftco-subheading mb-5" data-aos="fade-up"  data-aos-delay="600">
                
            </h2>
          </div>
        </div>
      </div>
    </section

        <div class="container" data-aos="fade-up">
            <div class="text-center">
                
                <% if (email == null){ %>
                    <i>les offres d'emploi pour notre emploieur </i>
                    <a class="nav-link" href="login.jsp">postuler</a>
                <% } %>
            </div>
        </div>

<section >
    <div class="container">
        <div class="row mt-4">
            <div class="col-6">
                <div class="envoyer">
                    <% while (AllAnonceEtNosMet.next()) { %>
        
                <div data-aos="fade-right">
                    <h1 class="section-heading text-uppercase" ><% out.println(AllAnonceEtNosMet.getString("nom_nosMet"));%></h1>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
                    
                <div data-aos="fade-right">
                    <h2>Description du poste</h2>
                    <p><% out.println(AllAnonceEtNosMet.getString("description_nosMet"));%></p>
                </div>

                <div data-aos="fade-right">
                    <h2>Competences requises</h2>
                    <p></p>
                    <% while (getIdann_compt.next()) { %>
        
                        <ul>
                            <li><% out.println(getIdann_compt.getString("competence"));%></li>      
                        </ul>
                    <%}%> 
                </div>
         
                <div data-aos="fade-right">
                    <% while (getIdann_compt_typeCont.next()) { %>
                        <h2>Informations supplementaires</h2>
                        <ul>
                            <li>Salaire propose : <% out.println(getIdann_compt_typeCont.getString("salaire"));%>   </li>
                            <li>Type de contrat : <% out.println(getIdann_compt_typeCont.getString("type_Contrat"));%> </li>
                            <li>Horaire de travail : <% out.println(getIdann_compt_typeCont.getString("horairTrav"));%> </li>
                        </ul>
                    <%}%> 
                </div>
            </div>

                <button class="show-more-btn">POSTULER</button>
                <div class="col-6" id="images">
                    <img src="../images/annonce.jpg" alt="image" style="margin-left: 124px; width: 233px; display: none;">
                </div>


                <%}%> 
            </div> 
            <div class="col-6" id="image">
                <img src="../images/annonce.jpg" alt="image" style="margin-left: 124px; width: 233px;">
            </div>
            
            <div class="col-6 ">
                <div class="envoyeCard" >          
                    <div class="more-content">
                        <div class="card champ1 ">
                            <div class="card-body">
                                
                                <% if (email == null){ %>
                                <form action="../estinsertionDemandExt" method="POST" enctype="multipart/form-data">
                                    
                                    
                                    <% while (getIdAnn.next()) { %>
                                        <input type="hidden" value="<% out.println(getIdAnn.getString("id_ann"));%>" name="id_ann">
                                    <%}%>

                                    <div class="champ">
                                        <div class="mb-3">
                                            <div class="col-md-12">
                                                <label  for="validationCustom04" class="form-label">Objet de la demande</label>

                                                <select name="id_demandeI" id="mySelect" class="form-control" aria-label="Default select example">
                                                   <option selected>Choisissez... </option>
                                                   <% while (AllObjetDem.next()) { %>
                                                      <option value="<% out.println(AllObjetDem.getString("id_objetDemI")); %>">
                                                            <% out.println(AllObjetDem.getString("objet_demandeI")); %>
                                                      </option>
                                                   <% }%>
                                                </select>              
                                            </div>
                                                
                                            <% while (AllContenuEx.next()) { %>
                                                <input type="text" name="id" value="<% out.println(AllContenuEx.getInt("id_demEx")+1);%>">
                                            <%}%>
                                                
                                            <div class="col-md-12" >
                                                <label for="validationCustom01" class="form-label">Contenu de la demande </label>
                                                <textarea class="form-control" id="contenu" rows="3" name="contenu_demI" ></textarea>    
                                                <span id="contenu-error" style="display: none; color:red;">Veuillez entrer le Contenu.</span>
                                            </div>
                                            <div class="col-mg-12 mt-4">
                                                <label for="exampleFormControlInput1" class="form-label">Nom</label>
                                                <input type="text" class="form-control" id="nomComplet" placeholder="" name="nom">
                                                <span id="nom-error" style="display: none; color:red;">Veuillez entrer nom.</span>
                                            </div>
                                                                                    
                                            <div class="col-mg-12">
                                                <label for="exampleFormControlInput1" class="form-label">Prenom</label>
                                                <input type="text" class="form-control" id="prenom" placeholder="" name="prenom">
                                                <span id="prenom-error" style="display: none; color:red;">Veuillez entrer le prenom.</span>
                                            </div>
                                                                                        
                                            <div class="col-mg-12">
                                                <label for="exampleFormControlInput1" class="form-label">Tel</label>
                                                <input type="text" class="form-control" id="phone" name="tel" >                                           
                                                <span id="phone-error" style="display: none; color:red;">Veuillez entrer un numero de telephone !.</span>
                                            </div>
                                            
                                            <div class="col-mg-12 mt-4">
                                                <label for="validationCustomUsername" class="form-label">email</label>
                                                <div class="input-group has-validation">
                                                   <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                   <input type="email" class="form-control" id="email" name="email" aria-describedby="inputGroupPrepend" required>
                                                </div>   
                                                <span id="email-error" style="display: none; color:red;">Veuillez entrer un email !.</span>
                                            </div>
                                                                                        
                                            <div class="col-mg-12 mt-4">
                                                <label for="exampleFormControlInput1" class="form-label">adresse</label>
                                                <input type="text" class="form-control" id="adresse" placeholder="" name="adresse">
                                                <span id="adresse-error" style="display: none; color:red;">Entrer l'adresse postale !.</span>
                                            </div>
                                            
                                            <% while (AllSex.next()) { %>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="id_sexe" id="inlineRadio1" value="<% out.println(AllSex.getString("id_sexe")); %>">
                                                    <label class="form-check-label" for="inlineRadio1"><% out.println(AllSex.getString("sexe")); %></label>
                                                </div>
                                            <% }%>

                                        </div>
                           
                                        <div class="input-group mb-3 btnInfo ajoutInfo" >
                                            <div class="form-group">
                                                <label for="exampleFormControlFile1">Entrer votre CV</label>
            
                                                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
                                            </div>
                                        </div> 
                                    </div>
                                            
                                    
                                    <div class="read_more">
                                        <div class="center">
                                            <input 
                                                type="button" 
                                                class="btn btn-primary"
                                                data-bs-toggle="modal" 
                                                data-bs-target="#messageAnn" 
                                                onclick="validateForm()"
                                                value="Envoyer">
                                        </div>
                                    </div>      
                                            <!-- Message Oui ou Non -->   
                                    <div class="modal fade" id="messageAnn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                              <div class="modal-header">
                                                      <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                                      <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                          <a href="recrutement.jsp?">
                                                              <i class="fa fa-close red_color"></i>
                                                          </a>
                                                      </span>
                                                  </div>
                                                  <div class="modal-body">
                                                      <h4 class="modal-title" id="exampleModalLabel">êtes vous sûr d'envoyer votre email?</h4>
                                                  </div>
                                                  <div class="modal-footer">
                                                      <div class="accept">
                                                          <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                              <a href="recrutement.jsp" >
                                                                 <input class="btn btn-danger "value="Non" style="width: 57px;">
                                                              </a>
                                                          </div>
                                                      </div>
                                                      <div class="accept">
                                                          <input class="btn btn-success " onclick="validate()" type="submit" value="Oui">
                                                      </div>
                                                  </div>
                                            </div>
                                        </div>
                                    </div>        
                                </form>
                                            
                                <% } else { %>
                                        <!-- demande interne -->
                                        <div class="col-md-12" >
                                            <form action="../estDem_I" method="POST" enctype="multipart/form-data" >
                                            <div class="col-md-12">
                                                <label  for="validationCustom04" class="form-label">Objet de la demande interne</label>
                                                
                                                <select name="id_demandeI" id="mySelect" class="form-control" aria-label="Default select example">
                                                   <option selected>Choisissez... </option>
                                                   <% while (AllObjetDem.next()) { %>
                                                      <option value="<% out.println(AllObjetDem.getString("id_objetDemI")); %>">
                                                            <% out.println(AllObjetDem.getString("objet_demandeI")); %>
                                                      </option>
                                                   <% }%>
                                                </select>   
                                            </div>
                                                
                                            <% while (AllContenu.next()) { %>
                                                <input type="hidden" name="id_demI" value="<% out.println(AllContenu.getString("id_demi"));%>">
                                            <%}%>
                                                
                                            <div class="col-md-12" >
                                                <label for="validationCustom01" class="form-label">Contenu de la demande interne</label>
                                                <textarea class="form-control" id="contenu" rows="3" name="contenu_demI" required ></textarea>
                                                 <span id="contenu-error" style="display: none; color:red;">Veuillez entrer le Contenu.</span>
                                            </div>
                                            <div class="col-md-12" >
                                                <label for="validationCustom01" class="form-label">Fiche du poste </label>
                                                <textarea class="form-control" id="fiche" rows="3" name="ficheDePoste_demI" required ></textarea>
                                                <span id="fiche-error" style="display: none; color:red;">Veuillez entrer le Contenu.</span>
                                            </div>
                                                                 
                                       
                                         <% while (V_res.next()) { %>
                                        <input type="hidden" name="id_visit" value="<% out.println(V_res.getString("id_visit"));%>">
                                        <%}%>
                                        <% while (getIdAnn.next()) { %>
                                            <input type="hidden" value="<% out.println(getIdAnn.getString("id_ann"));%>" name="id_ann">
                                        <%}%>

                                            <div class="champ"  >
                                                <div class="input-group mb-3 btnInfo ajoutInfo">
                                                    <div class="form-group">
                                                        <label for="exampleFormControlFile1">Entrer votre CV</label>
                                                        <input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
                                                    </div>
                                                </div> 
                                            </div>
                                       
                                        
                                        <div class="read_more">
                                            <div class="center">
                                                <input 
                                                    type="button" 
                                                    class="btn btn-primary"
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#messageAnn" 
                                                    onclick="validateForm()"
                                                    value="Envoyer">
                                            </div>
                                        </div>      
                                                <!-- Message Oui ou Non -->   
                                        <div class="modal fade" id="messageAnn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                  <div class="modal-header">
                                                          <h5 class="modal-title" id="staticBackdropLabel">Question</h5>
                                                          <span type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                              <a href="recrutement.jsp">
                                                                  <i class="fa fa-close red_color"></i>
                                                              </a>
                                                          </span>
                                                      </div>
                                                      <div class="modal-body">
                                                          <h4 class="modal-title" id="exampleModalLabel">êtes vous sûr d'envoyer votre demande?</h4>
                                                      </div>
                                                      <div class="modal-footer">
                                                          <div class="accept">
                                                              <input class="btn btn-success " onclick="validate()" type="submit" value="Oui">
                                                          </div>
                                                          <div class="accept">
                                                              <div class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                  <a href="recrutement.jsp" >
                                                                     <input class="btn btn-danger "value="Non" style="width: 57px;">
                                                                  </a>
                                                              </div>
                                                          </div>
                                                          
                                                      </div>
                                                </div>
                                            </div>
                                        </div> 
                                    </form>
                                        </div>
                                        
                                <% } %>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
                            
                            <footer class="ftco-footer ftco-bg-dark ftco-section">
    <div class="container">
      <div class="row mb-5">
        <div class="col-md">
          <div class="ftco-footer-widget mb-4">
            <h2 class="ftco-heading-2">A propos Value-IT</h2>
            <ul class="list-unstyled">
                <li><a href="../page/A propos.jsp" class="py-2 d-block">A propos</a></li>
                <li><a href="admin/dashbord/Publication.jsp" class="py-2 d-block">Publications</a></li>
                <li><a href="../page/contact.jsp" class="py-2 d-block">Contact</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md">
           <div class="ftco-footer-widget mb-4">
            <h2 class="ftco-heading-2">Communautes</h2>
            <ul class="list-unstyled">
                <li><a href="../page/recrutemnt.jsp" class="py-2 d-block">Recrutement</a></li>
            </ul>
          </div>
        </div>
      </div>
        <div class="row">
          <div class="col-md-12 text-center">
        </div>
    </div>
  </footer>
</section>
        <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            console.log( message + " sfsq")
            if (message == 1) {
                console.log( message + "ss")
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
       <script src="../admin/dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>   
       <script src="../admin/dashbord/js/js_erreur/jsError.js"></script>
       
    <script>
        var exampleModal = document.getElementById('messageAnn')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Accéptation' 
        })
    </script>
   <script >
        var exampleModal = document.getElementById('exampleModal1')
        exampleModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var modalTitle = exampleModal.querySelector('.modal-title')
        var modalBodyInput = exampleModal.querySelector('.modal-body input')
        modalTitle.textContent = 'Accéptation' 
        })
    </script> 
    <script>
        const showMoreBtn = document.querySelector('.show-more-btn');
        const moreContent = document.querySelector('.more-content');
        var image = document.getElementById("image");


        showMoreBtn.addEventListener('click', () => {
        moreContent.style.maxHeight = 'none';
        showMoreBtn.style.display = 'none';   
         image.style.display = "none";

        });
    </script>
    
    <script>
        document.getElementById("voirPlusBtn").addEventListener("click", function() {
      var hiddenContent = document.getElementsByClassName("hidden");
      var images = document.getElementById("images");

      
      for (var i = 0; i < hiddenContent.length; i++) {
        hiddenContent[i].style.display = "block";

      }
      
      this.style.display = "none";
      images.style.display = "block";

    });
    </script>
<script>
        function validateForm(){
    
        // si vide adresse
        var input = document.getElementById("adresse");
        var adresseError = document.getElementById("adresse-error");

        var value = input.value.trim();

        if (value.length === 0) {
            adresseError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             adresseError.style.display = "none";
            champVidenomComplet.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
        // si vide contenu
        var input = document.getElementById("contenu");
        var contenuError = document.getElementById("contenu-error");

        var value = input.value.trim();

        if (value.length === 0) {
            contenuError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             contenuError.style.display = "none";
            champVidenomComplet.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
        // si vide prenom
        var input = document.getElementById("prenom");
        var prenomError = document.getElementById("prenom-error");

        var value = input.value.trim();

        if (value.length === 0) {
             prenomError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             prenomError.style.display = "none";
            champVidenomComplet.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
        //phone
        var phoneInput = document.getElementById("phone");
        var phonePattern = /^[0-9]{3} ?[0-9]{2} ?[0-9]{3} ?[0-9]{2}$/;
        var phoneError = document.getElementById("phone-error");

        var phoneValue = phoneInput.value;

        if (!phonePattern.test(phoneValue)) {
          phoneError.style.display = "inline";
          phoneError.style.position ="fixed";
          phoneInput.style.border = "1px solid red";

        } 
        else {
          phoneError.style.display = "none";
          phoneInput.style.border = "1px solid #ccc";
          phoneInput.value = phoneValue;
        }
                    // si vide nom
        var input = document.getElementById("nomComplet");
        var nomError = document.getElementById("nom-error");

        var value = input.value.trim();

        if (value.length === 0) {
            nomError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             nomError.style.display = "none";
            champVidenomComplet.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
            
    //email error
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
    }
  
   </script>   
    <script>
    function validate(){
      // si vide fiche
        var input = document.getElementById("fiche");
        var ficheError = document.getElementById("fiche-error");

        var value = input.value.trim();

        if (value.length === 0) {
            ficheError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             ficheError.style.display = "none";
            champVidenomComplet.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
              // si vide contenu
        var input = document.getElementById("contenu");
        var contenuError = document.getElementById("contenu-error");

        var value = input.value.trim();

        if (value.length === 0) {
            contenuError.style.display = "inline";
            input.style.border = "1px solid red";
        } else {
             contenuError.style.display = "none";
            champVidenomComplet.style.display = "none";
            input.style.border = "1px solid #ccc";
        }
    }
    </script>

</body>
</html>
