// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var $star_rating = $('.star-rating .fa');

var SetRatingStar = function() {
  return $star_rating.each(function() {
    if (parseInt($(this).siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
      console.log("add star");
      return $(this).html('star');
    } else {
      console.log("remove star");
      return $(this).html('star_border');
    }
  });
};




$(document).on('turbolinks:load', function() {
  $star_rating = $('.star-rating .fa');
  SetRatingStar();
  $('.edit-rating .fa').on('mouseover', function() {
    $star_rating.siblings('input.rating-value').val($(this).data('rating'));
    return SetRatingStar();
  });
});
