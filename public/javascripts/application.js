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
  }, 3000);


  // Zebrafy table rows
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

  $('.post_content').click(function(){
    // TODO show the meta & set it as "unhidable" with an attribute
    // this gives us iPad/iPhone compatibility
  });

  // Hijax all remote links & forms
  // TODO

});