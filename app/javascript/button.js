window.addEventListener('load', function(){
  const pullDownButton  = document.getElementsByClassName("button");
  pullDownButton.addEventListener("mouseover", function(){
   pullDownButton.setAttribute("style", "background-color:black;")
  });
  pullDownButton.addEventListener("mouseout", function(){
    pullDownButton.removeAttribute("style", "background-color:black;")
  });
});