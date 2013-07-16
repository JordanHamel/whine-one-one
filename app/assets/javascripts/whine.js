var getWhine = function() {
  $.getJSON('/all/pick_whine.json', function(data) {
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
