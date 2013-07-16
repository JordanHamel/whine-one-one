//= require jquery
//= require jquery_ujs

$(function() {
  $(".call").hover(
    function() {
      $(".call").addClass("animated tada");
    },
    function() {
      $(".call").removeClass("animated tada");
    });
});
