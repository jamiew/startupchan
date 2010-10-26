/*
* Wit & Candor
*/

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
  $('.posts li').hover(function(){ 
    $(this).find('.post_meta').show().css('display', 'inline');
  }, function(){
    $(this).find('.post_meta').hide();
  });
  
  // Hijax all remote links & forms
  // TODO

});