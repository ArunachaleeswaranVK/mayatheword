 # Place all the behaviors and hooks related to the matching controller here.
 # All this logic will automatically be available in application.js.
 # You can use CoffeeScript in this file: http://coffeescript.org/

 $(document).on "page:change", ->     
   $("#comments-link").click (event) ->
     event.preventDefault()
     $("#comments-section").fadeToggle()
     $("#comment_commenter").focus()
     
            


