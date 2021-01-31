$(function (){
  $(document).on("click","#posting", function (){
    $.ajax ({
       url: "http://zipcloud.ibsnet.co.jp/api/search?zipcode=" + $("#zipcoding").val(),
         dataType : "jsonp",
    }).done(function(data) {
       if(data.results){
        setData(data.results[0])
       }else{
         alert("該当するデータが見つかりませんでした")
       }
    }).fail(function(data){
      alert("通信に失敗しました")
    })
 });
  function setData(data){
   $("#addressing").val(data.address1 + data.address2 + data.address3);
  }
});