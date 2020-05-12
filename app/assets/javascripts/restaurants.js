



window.onload = function(){
  let scrollCircle = document.querySelector('.scroll-circle');
  scrollCircle.classList.remove("hide-scroll");
  scrollCircle.addEventListener('click',function(){
  let navBar = document.querySelector('.navbar');
  navBar.scrollIntoView({behavior: 'smooth', block: 'start'});
 })
}
