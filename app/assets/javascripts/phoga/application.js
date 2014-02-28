//= require jquery
//= require jquery_ujs
//= require bootstrap

jQuery(function($) {
  var $main = $('.main-container');
  var $nav = $('.navigation');

  $('.expand-navigation-button').on('click', function(e) {
    e.preventDefault();
    console.log('test')
    if ($main.hasClass('expanded-navigation')) {
      $main.removeClass('expanded-navigation');
    } else {
      $main.addClass('expanded-navigation');
    }

    if ($nav.hasClass('navigation--expanded')) {
      $nav.removeClass('navigation--expanded');
    } else {
      $nav.addClass('navigation--expanded');
    }
  });
});
