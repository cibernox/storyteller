$(function(){
  $('.play').on('click', function(ev){
    ev.preventDefault();
    var xhr = new XMLHttpRequest()
    xhr.open("GET", $(this).href, true)
    xhr.onprogress = function () {
      $('#chat').append('<p class="story-line">' + xhr.responseText + '</p>');
    }
  });
});