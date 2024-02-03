function validateForm() {
    // si vide nomComplet
    var input = document.getElementById("nomComplet");
    var value = input.value.trim();

    if (value.length === 0) {
        champVidenomComplet.style.display = "inline";
        input.style.border = "1px solid red";
    } else {
        champVidenomComplet.style.display = "none";
        input.style.border = "1px solid #ccc";
    }
    //   // test si vide mdp < 8
    //   // var input0 = document.getElementById("mpd");
    //   // var mdpError = document.getElementById("mdpError");
    //   // var value = input.value.trim();
  
    //   // if( input0 < 5) {
    //   //   mdpError.style.display = "inline";
    //   //   input0.style.border = "1px solid red";
    //   // } else {
    //   //   mdpError.style.display = "none";
    //   //   input0.style.border = "1px solid #ccc";
    //   // }
    // // test si vide username
    var input = document.getElementById("username");
    var value = input.value.trim();

    if (value.length === 0) {
        champVideusername.style.display = "inline";
        input.style.border = "1px solid red";
    } else {phone
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

    // // email error
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

    
  }