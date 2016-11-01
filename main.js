$(document).ready(function(){
  var boxes = $(".box-shadow");
  $.each(boxes, function(i, box){
    var width = $(this).closest(".boxed").find(".box").css("width");
    $(this).width(width);
    var height = $(this).closest(".boxed").find(".box").css("height");
    $(this).height(height-7);
  });
  var headerLeft = $(".boxed span").first().position().left;
  $(".boxed .box-shadow").first().css("left", (headerLeft)+"px");
  $(window).resize(function(){
    var boxes = $(".box-shadow");
    $.each(boxes, function(i, box){
      var width = $(this).closest(".boxed").find(".box").css("width");
      $(this).width(width);
      var height = $(this).closest(".boxed").find(".box").css("height");
      $(this).height(height-7);
    });
    var headerLeft = $(".boxed span").first().position().left;
    $(".boxed .box-shadow").first().css("left", (headerLeft)+"px");
  });
});
