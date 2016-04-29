//= require bootstrap/transition
//= require bootstrap/affix
//= require bootstrap/collapse
//= require bootstrap/carousel
//= require bootstrap/modal

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

  do ->
    return unless window.google

    mapCanvas = document.querySelector('.js-contact-location-map')
    return unless mapCanvas

    $contactLocations = $('.js-contact-location')
    $firstContactLocation = $contactLocations.first()
    centerLat = $firstContactLocation.data('lat')
    centerLng = $firstContactLocation.data('lng')

    # Center map in the first location.
    mapOptions =
      center: new google.maps.LatLng(centerLat, centerLng)
      zoom: 16
      scrollwheel: false
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new google.maps.Map(mapCanvas, mapOptions)

    # Add markers for every location.
    for contactLocation in $contactLocations
      $contactLocation = $(contactLocation)
      lat = $contactLocation.data('lat')
      lng = $contactLocation.data('lng')

      new google.maps.Marker
        position: new google.maps.LatLng(lat, lng)
        map: map

    # Change map center on location's click.
    $contactLocations.click ->
      $location = $(this)
      lat = $location.data('lat')
      lng = $location.data('lng')

      map.setCenter new google.maps.LatLng(lat, lng)

      return

    return

  do ->
    $('.contact-thanks__modal').modal('show')
    return

  do ->
    if window.location.pathname == '/'
      if window.location.hash == '#cases'
        casesTop = $('#cases').offset().top
        $('html, body').animate({ scrollTop: casesTop - 130 }, 500);
      else
        cookieKey = 'sawEloquentHero'

        if document.cookie.indexOf(cookieKey) > -1
          mainTop = $('main').offset().top
          $('html, body').animate({ scrollTop: mainTop - 90 }, 500);
        else
          document.cookie = "#{cookieKey}=1"

  return
