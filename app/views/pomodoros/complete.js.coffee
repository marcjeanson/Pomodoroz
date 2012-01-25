$("#<%= dom_id(@activity, :pomodoros) %>").html("<%= escape_javascript(render partial: 'activities/pomodoro', collection: @activity.pomodoros) %>")
$("#reset_timer").html ""
