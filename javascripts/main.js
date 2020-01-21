$(document).ready(function(){

  // $(".get-tickets").on("click", function(e){
  //   var href = $(this).attr("href").replace("/", "");
  //   $("body").animate({
  //     scrollTop: $(href).offset().top - 70 
  //   }, 'slow');
  // });
  //
  $(".nav-link--menu--open").on("click", function(e) {
    console.log("works");
    $(".nav-link--menu").toggleClass("active");
    //$(".nav-link--menu").slideToggle();
  });

});
