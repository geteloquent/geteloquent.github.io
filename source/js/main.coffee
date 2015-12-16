//= require bootstrap/transition
//= require bootstrap/collapse
//= require bootstrap/carousel

$ ->
  $('.js-full-height').height $(window).height()

  # Smooth scrolling.
  $('a[href*=#]:not([href=#])').click ->
    target = $(@hash)

    if target.length
      $('html, body').animate { scrollTop: target.offset().top }, 1000
      return false

    return
