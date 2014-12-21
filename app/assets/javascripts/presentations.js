//= require jquery
//= require jquery_ujs
//= require websocket_rails/main


$(function () {
  var max = parseInt($(window).height() * 0.8);
  $('section img').css('max-height',max+'px');


  $('.fadeIn').each(function(i) {
    $(this).delay((i++) * 500).fadeTo(500, 1);
  });

  // $('.presentation-navigation.expanded, .slide-navigation.expanded').width(parseInt($(window).width() * 0.18)+"px");
  $('.presentation-navigation, .slide-navigation').mouseenter(function () {
    $(this).addClass('expanded');
  }).mouseleave(function () {
    $(this).removeClass('expanded');
  });
    
});