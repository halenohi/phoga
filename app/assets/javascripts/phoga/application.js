//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery_nested_form
//= require ./bootstrap-tagsinput
//= require ./jquery.autosize
//
//= require underscore
//= require backbone
//= require ./phoga
//= require_tree ./modules
//= require_tree ../../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers

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
