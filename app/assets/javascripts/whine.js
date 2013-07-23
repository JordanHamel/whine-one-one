var i = 0;
var whineId;
var whines;
var tag;

var nextWhine = function() {
  if (whines[i]) {
    $('#whine').append(whines[i].message);
    $.getJSON('/' + whines[i].id + '/get_tags.json', function(data) {
      for (var i=0; i<data.length; i++) {
        tag = data[i].text;
        $('#tags').append("<a href='/" + tag + "'> #" + tag + "</a> ");
      };
    });
    i += 1;
  } else {
    $('#whine').append("It looks like you've hit the end :(");
  }
};

var clear = function() {
  $('#whine').empty();
  $('#tags').empty();
};

$(function() {
  $.getJSON('/whine/all.json', function(data) {
    whines = data;
  }).success(function() {

    nextWhine();

    $(function() {
      $(".call").addClass("animated tada");
    });

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
