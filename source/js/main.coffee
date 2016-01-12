//= require bootstrap/transition
//= require bootstrap/affix
//= require bootstrap/collapse
//= require bootstrap/carousel

$ ->
  $layoutWrapper = $('.js-layout__wrapper')
  $layoutNavBar = $('.js-layout__nav-bar')
  isFixedClass = 'is-fixed'

  # Smooth scrolling.
  do ->
    # Account for affixed desktop navigation's height.
    offset = if $layoutWrapper.hasClass(isFixedClass) then $layoutNavBar.height() else 0

    $('.js-smooth-scrolling').click ->
      target = $(@hash)

      if target.length
        $('html, body').animate { scrollTop: target.offset().top - offset }, 1000
        return false

      return

    return

  # Toggle off-canvas mobile aside's menu.
  do ->
    $headerMenuToggle = $('.js-header__menu-toggle')
    $layout = $('.js-layout')

    $headerMenuToggle.click -> $layout.toggleClass 'is-closed'

    return

  # Calculate the nav bar's affix top position.
  do ->
    return unless $layoutNavBar.length

    $layoutNavBar.affix offset:
      top: $layoutNavBar.offset().top

    # Toggle fixed class to a parent wrapper.
    $layoutNavBar.on 'affixed.bs.affix', -> $layoutWrapper.addClass isFixedClass
    $layoutNavBar.on 'affixed-top.bs.affix', -> $layoutWrapper.removeClass isFixedClass

    return

  # Toggle caret rotate class when collapsing methodology step.
  do ->
    $methodologyStepContentWrappers = $('.js-methodology-step__content-wrapper')
    stepSelector = '.js-methodology-step'
    isOpenClass = 'is-open'

    $methodologyStepContentWrappers.on 'show.bs.collapse', -> $(this).closest(stepSelector).addClass isOpenClass
    $methodologyStepContentWrappers.on 'hide.bs.collapse', -> $(this).closest(stepSelector).removeClass isOpenClass

    return

  return
