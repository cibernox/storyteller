$(function(){
  $('.play').on('click', function(ev){
    ev.preventDefault();
    var source = new EventSource(this.href);
    source.addEventListener('message', function(e) {
      var $line = $('<p class="story-line">' + e.data + '</p>');
      $line.appendTo('#chat').hide().fadeIn(200, function(){
        $("html, body").animate({ scrollTop: $(document).height() }, "slow");
      })
    }, false);
  });
});