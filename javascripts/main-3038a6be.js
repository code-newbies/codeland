$(document).ready(function(){$(".nav-link--menu--open").on("click",function(){$(".nav-link--menu").toggleClass("active")}),$(".nav-link--item > a").on("click",function(){$(".nav-link--menu").removeClass("active")});var n=0;$(window).scroll(function(){n=$(window).scrollTop(),n>=100?($(".nav-link--container").addClass("scrolled"),$(".nav-link--menu").addClass("scrolled")):n<100&&($(".nav-link--container").removeClass("scrolled"),$(".nav-link--menu").removeClass("scrolled"))})});