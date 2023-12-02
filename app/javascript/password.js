






// let showUserNamedBtn = document.querySelector('')
document.getElementById("reg-username").addEventListener("keyup", () => {
  var username = document.getElementById("reg-username").value;
  if(username == ""){
    verifica_bottone(0 , "username");
  }
  else{
    verifica_bottone(1 , "username");
  }
});

// let showNomedBtn = document.querySelector('')
document.getElementById("reg-nome").addEventListener("keyup", () => {
  var nome = document.getElementById("reg-nome").value;
  if(nome == ""){
    verifica_bottone(0 , "nome");
  }
  else{
    verifica_bottone(1 , "nome");
  }
});

// let showCognomedBtn = document.querySelector('')
document.getElementById("reg-cognome").addEventListener("keyup", () => {
  var cognome = document.getElementById("reg-cognome").value;
  if(cognome == ""){
    verifica_bottone(0 , "cognome");
  }
  else{
    verifica_bottone(1 , "cognome");
  }
});







// let showCAPdBtn = document.querySelector('')
document.getElementById("reg-cap").addEventListener("keyup", () => {
  var x = 0;
  var cap = document.getElementById("reg-cap").value;
  var bar4 = document.getElementById("barra-cap");
  var capReg = /^[0-9]{5}$/;
  if(capReg.test(cap) && cap != ""){
    x+=75;
  }
  // risultato
  bar4.style.width = (x) + "%";
  // voto massimo 100
  if (x == 75) {
    bar4.style.backgroundColor = "green";
    verifica_bottone(1 , "cap");
  }
  if (x == 0) {
      x = 5;
      bar4.style.width = x + "%";
      bar4.style.backgroundColor = "red";
      verifica_bottone(0 , "cap");
  }
});



// let showCelldBtn = document.querySelector('')
document.getElementById("reg-cell").addEventListener("keyup", () => {
  var x = 0;
  var cell = document.getElementById("reg-cell").value;
  var bar3 = document.getElementById("barra-cell");
  var cellReg = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/;
  if(cellReg.test(cell) && cell != ""){
    x+=75;
  }
  // risultato
  bar3.style.width = (x) + "%";
  // voto massimo 100
  if (x == 75) {
    bar3.style.backgroundColor = "green";
    verifica_bottone(1 , "cell");
  }
  if (x == 0) {
      x = 5;
      bar3.style.width = x + "%";
      bar3.style.backgroundColor = "red";
      verifica_bottone(0 , "cell");
  }
});




// let showEmaildBtn = document.querySelector('')
document.getElementById("reg-email").addEventListener("keyup", () => {
  var x = 0;
  var email = document.getElementById("reg-email").value;

  var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;

  if(emailReg.test(email) && email != ""){
    x+=75;
  }

  // voto massimo 100
  if (x == 75) {
    verifica_bottone(1 , "email");
  }
  if (x == 0) {
      x = 5;
      verifica_bottone(0 , "email");
  }
});






// let showPasswordBtn = document.querySelector('')
document.getElementById("reg-pass").addEventListener("keyup", () => {
    var x = 0;
    var password = document.getElementById("reg-pass").value;
    var bar = document.getElementById("barra");

    //controllo numeri
    var check=/[0-9]/;
    if(check.test(password)){
      x += 15;
    }
    //controllo minuscole
    var check2=/[a-z]/;
    if(check2.test(password)){
        x += 15;
    }
    //controllo maiuscole
    var check3=/[A-Z]/;
    if(check3.test(password)){
        x += 15;
    }
    //controllo simboli
    var check4=/[$-/:-?{-~!"^_`\[\]]/;
    if(check4.test(password)){
        x += 15;
    }
    // controllo lunghezza (minore o uguale a 10 caratteri)
    if(password.length >= 8){
        x += 15;
    }
  
    // risultato
    bar.style.width = (x) + "%";
    // voto massimo 100

    if (x == 75) {
      bar.style.backgroundColor = "green";
      verifica_bottone(1 , "pass");
    }
    if (x <= 60) {
        bar.style.backgroundColor = "#00FF00";
        verifica_bottone(0 , "pass");
      }
    if (x <=45) {
      bar.style.backgroundColor = "#FF9900";
    }
    if (x <=30) {
      bar.style.backgroundColor = "yellow";
    }
    //voto minimo 20
    if (x <=15) {
      bar.style.backgroundColor = "red";
    }
    if (x == 0) {
        x = 5;
        bar.style.width = x + "%";
        bar.style.backgroundColor = "red";
    }
  });


var controllo_username = 0;
var controllo_nome = 0;
var controllo_cognome = 0;

var controllo_cap = 0;
var controllo_cell = 0;
var controllo_email = 0;
var controllo_pass = 0;


function verifica_bottone(valore,campo){

  if (campo == "username"){
    controllo_username = valore;
  }
  if (campo == "nome"){
    controllo_nome = valore;
  }
  if (campo == "cognome"){
    controllo_cognome = valore;
  }
  /*
  if (campo == "ristoratore"){
    controllo_ristoratore = valore;
  }
  */
  if (campo == "cap"){
    controllo_cap = valore;
  }
  if (campo == "cell"){
    controllo_cell = valore;
  }
  if (campo == "email"){
    controllo_email = valore;
  }
  if (campo == "pass"){
    controllo_pass = valore;
  }

  if(controllo_username == 1 && controllo_nome == 1 && controllo_cognome == 1 && 
      controllo_cap == 1 && controllo_cell == 1 && controllo_email == 1 && controllo_pass == 1){
    document.getElementById("reg-submit").disabled = false;
    document.getElementById("reg-submit").style.backgroundColor = "green";
  }
  if(controllo_username == 0 || controllo_nome == 0 || controllo_cognome == 0 || 
      controllo_cap == 0 || controllo_cell == 0 || controllo_email == 0 || controllo_pass == 0){
    document.getElementById("reg-submit").disabled = true;
    document.getElementById("reg-submit").style.backgroundColor = "red";
  }

  console.log(controllo_username);
  console.log(controllo_nome);
  console.log(controllo_cognome);
  console.log(controllo_cap);
  console.log(controllo_cell);
  console.log(controllo_email);
  console.log(controllo_pass);



}






