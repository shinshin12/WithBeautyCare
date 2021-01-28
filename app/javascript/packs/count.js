document.addEventListener("DOMContentLoaded", function(){

let textarea = document.getElementById("textarea");
let maxText = textarea.getAttribute("maxlength");

let textMessage = document.createElement("div");
textMessage.setAttribute("style", "color:white;")
let parent = textarea.parentElement;
parent.insertBefore(textMessage, textarea);

textarea.addEventListener("keyup", function(){
   let textNum = textarea.value.length;
   textMessage.innerHTML = "<P>あと" +  (maxText - textNum) + "文字入力できます"
 });
});