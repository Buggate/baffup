function scroll_to_class(o){var t=$("nav").outerHeight(),s=$(o).offset().top-t;$(window).scrollTop()!=s&&$("html, body").stop().animate({scrollTop:s},1e3)}jQuery(document).ready(function(){$.backstretch("assets/img/backgrounds/1.jpg"),$(".msf-form form fieldset:first-child").fadeIn("slow"),$(".msf-form form .btn-next").on("click",function(){$(this).parents("fieldset").fadeOut(400,function(){$(this).next().fadeIn(),scroll_to_class(".msf-form")})}),$(".msf-form form .btn-previous").on("click",function(){$(this).parents("fieldset").fadeOut(400,function(){$(this).prev().fadeIn(),scroll_to_class(".msf-form")})})});