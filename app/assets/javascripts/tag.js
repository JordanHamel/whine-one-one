var i = 0;
var whines;
var tagName;

var nextWhine = function() {
  if (whines[i]) {
    $('#trending-whine').append(whines[i].message);
    i += 1;
  } else {
    $('#trending-whine').append("No more whines :(");
  }
};

var clear = function() {
  $('#trending-whine').empty();
};

$(function() {
  tagName = $('#trending-whine').attr('data-tag-name');

  $.getJSON('/' + tagName + '/trending.json', function(data) {
    whines = data;
  }).success(function() {
    nextWhine();

    $('#next').click(function() {
      clear();
      nextWhine();
    });

    key('right', function() {
      clear();
      nextWhine();
    });
  });
});
