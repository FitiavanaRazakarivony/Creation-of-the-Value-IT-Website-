var message = "<%= request.getParameter('etat') %>";

console.log(message + " dfsf");

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