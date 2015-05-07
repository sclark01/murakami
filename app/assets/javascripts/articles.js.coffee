# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('nav.menu a').click ->
    $(this).parent().find('.current').removeClass 'current'
    $(this).addClass 'current'
    return
  $('a[data-connect]').click ->
    i = $(this).find('i')
    if i.hasClass('icon-collapse-top') then i.removeClass('icon-collapse-top').addClass('icon-collapse') else i.removeClass('icon-collapse').addClass('icon-collapse-top')
    $(this).parent().parent().toggleClass('all').next().slideToggle()
    return
  $(window).scroll ->
    w = $(window).width()
    if w < 768
      $('#top-button').hide()
    else
      e = $(window).scrollTop()
      if e > 150 then $('#top-button').fadeIn() else $('#top-button').fadeOut()
    return
  return
