
document.addEventListener("DOMContentLoaded", function(){

let searching = document.getElementById("search");
let button = document.getElementById("btn");
let button2 = document.getElementById("btn2");

searching.addEventListener("click", function(){
  button.setAttribute("style", "displey:block;");
  button2.setAttribute("style", "displey:block;");
 });
});