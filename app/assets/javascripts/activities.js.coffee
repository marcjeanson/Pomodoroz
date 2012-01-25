# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  setupSoundManager()

setupSoundManager = () ->
  soundManager.url = '/soundmanager/swf'
  soundManager.debugMode = false
  soundManager.onready ->
    soundManager.createSound
      id: 'bell'
      url: '/soundmanager/bell.mp3'

$('#activity_completed').live 'click', (event) ->
  $.ajax '/activities/' + $(event.target).attr('activity_id'),
  	type: 'PUT'
  	data: "activity[completed]=#{this.checked}"
  true

window.pomodoro_timer = (activity_id, pomodoro_id, time_in_seconds) ->
  $("#timer").createTimer
    time_in_seconds: time_in_seconds
    buzzer: () ->
      soundManager.play('bell')
      $.ajax
        url: '/activities/' + activity_id + '/pomodoros/' + pomodoro_id + '/complete.js'
        type: 'PUT'
