# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $(document).on 'click', '.above-toggle', (e) ->
    e.preventDefault()
    $('.above').fadeIn(2000)
    $('body').toggleClass("hideoverflow")
    e.stopPropagation()

  $(document).on 'click', '.thefa', (e) ->
    e.preventDefault()
    $('.above').fadeOut(1000)
    e.stopPropagation()

  $(document).on 'click', '.toggle-reply', (e) ->
    e.preventDefault()
    $(this).parent().find('.reply-toggle').fadeToggle(1000)
    $('.reply-toggle').not($(this).parent().find('.reply-toggle')).hide()
    e.stopPropagation()

  $(document).on 'click', '.del-toggle', (e) ->
    e.preventDefault()
    $(this).parent().find('.toggle').fadeToggle(500)
    $('.toggle').not($(this).parent().find('.toggle')).hide()

    e.stopPropagation()
