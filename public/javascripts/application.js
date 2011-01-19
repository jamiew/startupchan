/*
* Wit & Candor
*/

function metaFor(post){
  var name = '#'+$(post).parent()[0].id+'-meta';
  return $(name);
}

$(document).ready(function(){

  // Flashes
  $('.flash').hide().slideToggle('slow');
  setTimeout(function(){
    $('.flash').slideToggle('slow');
  }, 2000);

  // Zebrify table rows
  $("tr:even").css("background-color", "#000");
  $("tr:odd").css("background-color", "#111");

  // Faceboxify
  $('a[rel*=facebox]').facebox();

  // Show post reply & sticky controls on hover
  $('.post_content').hover(function(){
    metaFor(this).show().css('display', 'inline');
  }, function(){
    metaFor(this).hide();
  });

  // Show (and leave) meta controls on click... iOS doesn't have hover
  // Unbind hover actions so mouse movements don't hide it  
  $('.post_content a.text').click(function(){
    $(this).parent().unbind('mouseenter mouseleave');
    metaFor($(this).parent()).css('display', 'inline');
    return false;
  });


});