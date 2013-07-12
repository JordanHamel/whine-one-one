//= require jquery
//= require jquery_ujs
//= require_tree .

var getWhine = function() {
  $.getJSON('http://localhost:3000/pick_whine.json', function(data) {
    $('#whine').append(data.message);
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
