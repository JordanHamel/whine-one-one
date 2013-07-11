//= require jquery
//= require jquery_ujs
//= require_tree .

var getWhine = function() {
  $.getJSON('http://0.0.0.0:3000/pick_whine.json', function(data) {
    $('#whine').append('<p>' + data.message + '</p>');
  });
};

var clear = function() {
  $('#whine').empty();
};

$(function() {
  getWhine();
  $('#next').click(function() {
    clear();
    getWhine();
  });

  key('right', function() {
    clear();
    getWhine();
  });
});
