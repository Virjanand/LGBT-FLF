
$(".city-item").hover(function(){
  console.log($(this));
  $("body").css("background-image", 'url("/assets/'+ $(this)[0].outerText.toLowerCase() + '.jpg")');
},function(){});
