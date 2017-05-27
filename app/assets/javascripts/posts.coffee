# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote()
        height: 200
        
  
  
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