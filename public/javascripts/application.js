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
  // TODO

  // Hijax all remote links & forms
  // TODO

});