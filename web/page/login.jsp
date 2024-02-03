

<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String erreur= (String) session.getAttribute("error");
    session.removeAttribute("error");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <link rel="stylesheet" href="../admin/dashbord/bootstrap V5/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap.css">
       <!-- message css -->    	
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <style>
      /* Styles CSS pour la page de connexion */
      body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
      }
      .container {
        margin: 10% auto;
        width: 30%;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.2);
        //height: 438px;
      }
      h1 {
        text-align: center;
        color: #333;
      }
      input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
      }
      button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
      }
      button:hover {
        background-color: #45a049;
      }
      .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
      }
      .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
      }
      img.avatar {
        width: 30%;
        border-radius: 50%;
      }
      .container p {
        text-align: center;
      }
      span.psw {
        float: right;
        padding-top: 16px;
      }
      .erreur{
        color: red;
      }
    </style>
  </head>
  <body>
            
      <div  style="display: flex;justify-content: center;height: auto;column-gap: 2rem;box-shadow: blue;margin-top: 147px;">
        <div>
            <img src="../images/femme1.jpg" style="background-position: 50% -5px; background-size: 48rem;width: 28rem;height: 100%;">               
        </div>
        <div class="login">
        <div class="erreur">
        <% if( erreur != null) {%>
          <div class="alert alert-danger" role="alert">
            Assurez bien votre compte ! 
          </div>
        <% } %>
      </div>
        <h1>Connexion</h1>
      
        <form action="../checklogin" method="POST">
            <div class="imgcontainer">
              <img src="../images/logo.png" alt="image" style="width: 10rem;height: 2rem;">
            </div>
            <div>
              <label for="uname"><b>Nom d'utilisateur</b></label>
              <input type="text" placeholder="Entrer le nom d'utilisateur" name="pseudo" required>
            </div>
            <div>
              <label for="psw"><b>Mot de passe</b></label>
              <input type="password" placeholder="Entrer le mot de passe" name="motdepass_visit" required>
            </div>
            <button type="submit">Se connecter</button>

      </form>        


    </div>      
    </div>
    
      <script src="../admin/dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>
    <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            console.log( message + " sfsq")
             if (message == 0) {
              // Afficher la notification d'erreur avec Swal.fire()
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Verifier bien votre compte!'
              });
            }
        </script> 
  </body>

</html>
