$(document).ready(function(){
  var boxes = $(".box-shadow");
  $.each(boxes, function(i, box){
    var width = $(this).closest(".boxed").find(".box").css("width");
    $(this).width(width);
  });
  var headerLeft = $(".boxed").first().position().left;
  $(".boxed .box-shadow").first().css("left", "300px");
});
