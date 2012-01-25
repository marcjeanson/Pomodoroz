# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#activity_completed').live 'click', (event) ->
  $.ajax '/activities/' + $(event.target).attr('activity_id'),
  	type: 'PUT'  
  	data: "activity[completed]=#{this.checked}"
  true