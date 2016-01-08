//= require bootstrap/transition
//= require bootstrap/affix
//= require bootstrap/collapse
//= require bootstrap/carousel

$ ->
  # Smooth scrolling.
  $('.js-smooth-scrolling').click ->
    target = $(@hash)

    if target.length
      $('html, body').animate { scrollTop: target.offset().top }, 1000
      return false

    return

  do ->
    # Toggle off-canvas mobile aside's menu.
    $headerMenuToggle = $('.js-header__menu-toggle')
    $layout = $('.js-layout')

    $headerMenuToggle.click -> $layout.toggleClass 'is-closed'

    return

  do ->
    # Calculate the nav bar's affix top position.
    $layoutNavBar = $('.js-layout__nav-bar')

    return unless $layoutNavBar.length

    $layoutNavBar.affix offset:
      top: $layoutNavBar.offset().top

    # Toggle fixed class to a parent wrapper.
    $layoutWrapper = $('.js-layout__wrapper')
    isFixedClass = 'is-fixed'

    $layoutNavBar.on 'affixed.bs.affix', -> $layoutWrapper.addClass isFixedClass
    $layoutNavBar.on 'affixed-top.bs.affix', -> $layoutWrapper.removeClass isFixedClass

    return

  return
