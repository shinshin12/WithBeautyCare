$(function (){
  $("#btn").on("click", function (){
    $.ajax ({
       url: "http://zipcloud.ibsnet.co.jp/api/search?zipcode=" + $("#zipcode").val()
         dataType : "jsonp",
    })
 });
});