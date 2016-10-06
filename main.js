$(document).ready(function(){
  var boxes = $(".box-shadow");
  $.each(boxes, function(i, box){
    var width = $(this).closest("h2").find(".box").css("width");
    $(this).width(width);
  });
});
