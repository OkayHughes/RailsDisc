# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$("form").submit ->
  valuesToSubmit = $(this).serialize()
  #sumbits it to the given url of the form
  # you want a difference between normal and ajax-calls, and json is standard
  $.ajax(
    url: $(this).attr("action")
    data: valuesToSubmit
    dataType: "JSON"
  ).success (json) ->

  
  #act on result.
  false # prevents normal behaviour
