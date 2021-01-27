

document.addEventListener("DOMContentLoaded", function(){
let searching = document.getElementById("search")
let button = document.getElementById("btn")
let button2 = document.getElementById("btn2")

searching.addEventListener("mouseout", function(){
  let child = button.parentElement;
  child.removeChild(button)

  let child2 = button2.parentElement;
  child2.removeChild(button2)
})


})