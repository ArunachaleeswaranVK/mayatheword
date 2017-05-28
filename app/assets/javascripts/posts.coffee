# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote()
        height: 200
        
  $(document).ready ->
  $('#top').on 'click', (event) ->
    if @hash != ''
      event.preventDefault()
      hash = @hash
      $('html, body').animate { scrollTop: $(hash).offset().top }, 1000, ->
        window.location.hash = hash
        return
    return
  return
  
  
  
  
  $(document).ready(ready)
  $(document).on('page:load', ready)

$ ->  
  $(document).ready ->
  setTimeout (->
    $('.alert_wrapper').fadeOut 'slow', ->
      $(this).remove()
      return
    return
  ), 2500
  return 
  $(document).ready(ready)
  $(document).on('page:load', ready)
 

$(document).ready ->
  $(window).scroll ->
    if $(document).scrollTop() > 10
      $('#nav').addClass 'shrink'
    else
      $('#nav').removeClass 'shrink'
    return
  return
  $(document).ready(ready)
  $(document).on('page:load', ready)

  
  
  
  
  
  
  
  