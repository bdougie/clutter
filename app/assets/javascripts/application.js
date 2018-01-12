// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery.easing
//= require bootstrap
//= require typed.js/lib/typed
//= require turbolinks
//= require_tree .


var animateServices = function() {
  var revealService = function() {
    $(this).css({
      opacity: 1,
      transform: 'scaleX(1) translateY(0)'
    });
  };
  
  $.each($('.service-box'), revealService);
};

$(document).on('turbolinks:load', function() {

  // Clutter header animation
  $('.header-content-inner h1').addClass('animated pulse');

  // Navbar color change on scroll
  $(window).scroll(function() {
    if ($(document).scrollTop() > 50) {
      $('.navbar-default').addClass('scroll');
    } else {
      $('.navbar-default').removeClass('scroll');
    }
  });

  // Nav link ease scroll to section
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: (target.offset().top - 54)
        }, 1500, "easeInOutExpo");
        return false;
      }
    }
  });

  // Service box ease-in transition on scroll
  var scrollDistance = $('#services').offset().top - $(window).height() + 200;
  
  $(window).scroll(function(event) {
    if ($(window).scrollTop() >= scrollDistance) {
      animateServices();
    }
  });

  var header = {
    strings: ["^300 One Bedroom at a Time", "^300 One Bathroom at a Time", "^300 One Living Room at a Time", "^300 One Kitchen at a Time", "^300 One Closet at a Time"],
    typeSpeed: 50,
    backSpeed: 10,
    smartBackspace: true,
    loop: true
  }

  var typed = new Typed(".header-content-inner .typed", header);

});
