$("#<%= dom_id(@activity, :pomodoros) %>").html("<%= escape_javascript(render partial: 'activities/pomodoro', collection: @activity.pomodoros) %>")
reset_pomodoro_timer(<%= pomodoro_length_in_seconds %>)
