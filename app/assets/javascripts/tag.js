var tagName;

var getTrendingWhine = function() {
  $.getJSON('/' + tagName + '/pick_whine.json', function(data) {
    $('#trending-whine').append(data.message);
  });
};

var clear = function() {
  $('#trending-whine').empty();
};

$(function() {
  tagName = $('#trending-whine').attr('data-tag-name');
  getTrendingWhine();
  $('#next-trending-whine').click(function() {
    clear();
    getTrendingWhine();
  });

  key('right', function() {
    clear();
    getTrendingWhine();
  });
});
