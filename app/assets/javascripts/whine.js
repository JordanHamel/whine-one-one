var getWhine = function() {
  $.getJSON('/all/pick_whine.json', function(data) {
    $('#whine').append(data['whine'].message);

    for (var i=0; i<data['tags'].length; i++) {
      var tag = data['tags'][i].text;
      $('#tags').append("<a href='/" + tag + "'> #" + tag + "</a> ");
    }
  });
};

var clear = function() {
  $('#whine').empty();
  $('#tags').empty();
};

$(function() {
  getWhine();

  $(function() {
    $(".call").addClass("animated tada");
  });

  $('#next').click(function() {
    clear();
    getWhine();
  });

  key('right', function() {
    clear();
    getWhine();
  });
});
