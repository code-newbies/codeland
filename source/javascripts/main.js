$(document).ready(function(){
  $(".nav-link--menu--open").on("click", function(e) {
    $(".nav-link--menu").toggleClass("active");
  });

  $(".nav-link--item").on("click", function(e) {
    $(".nav-link--menu").removeClass("active");
  });

  var scrollTop = 0;

  // Animate Navbar on Scroll
  $(window).scroll(function() {
    scrollTop = $(window).scrollTop();

    if (scrollTop >= 100) {
      $(".nav-link--container").addClass("scrolled");
      $(".nav-link--menu").addClass("scrolled");
    } else if (scrollTop < 100) {
      $(".nav-link--container").removeClass("scrolled");
      $(".nav-link--menu").removeClass("scrolled");
    }
  });

  // Animate Stickers on Scroll
  // var heroPosition = $(".hero-section--image").position();
  // var heroSubtitlePosition = $(".hero-section--subtitle").position();

  // $(window).scroll(function() {
  //   scrollTop = $(window).scrollTop();

    // Shift stickers to end position
    // if (scrollTop >= (heroPosition.top)) {
    //   $(".sticker").addClass("scrolled");
    //   $(".section-container.overview").addClass("scrolled");
    // } else if (scrollTop < (heroPosition.top)) {
    //   $(".sticker").removeClass("scrolled");
    //   $(".section-container.overview").removeClass("scrolled");
    // }

    // $(".sticker").each(function(index){
    //   console.log( index + ": " + $( this ).offset().top);
    // })

    // Pin images to edge of viewport
    // if (scrollTop >= (heroSubtitlePosition.top)) {
    //   $(".sticker").addClass("fixed");

    //   // $(".sticker").css({
    //   //   top: offset.top
    //   // });

    // } else if (scrollTop < (heroSubtitlePosition.top)) {
    //   $(".sticker").removeClass("fixed");
    // }
  // });
});
