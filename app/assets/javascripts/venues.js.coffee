# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$('#venue_search').typeahead
  nombre: "venue"
  remote: "/venue/autocomplete?query=%QUERY"
