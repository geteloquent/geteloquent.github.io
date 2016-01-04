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

  $headerMenuToggle = $('.js-header__menu-toggle')
  $headerMenuToggle.click ->
    $layout = $('.js-layout')
    $layout.toggleClass('is-closed')
    return

  return
