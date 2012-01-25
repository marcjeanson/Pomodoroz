pomodoro_timer(<%= @activity.id %>, <%= @pomodoro.id %>, 1500)
$("#reset_timer").html "<%= escape_javascript(render partial: 'activities/reset_link', locals: { activity_id: @pomodoro.activity.id, pomodoro_id: @pomodoro.id }) %>"
