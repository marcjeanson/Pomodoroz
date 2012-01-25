pomodoro_timer(<%= @activity.id %>, <%= @pomodoro.id %>, <%= pomodoro_length_in_seconds %>)
$("#reset_timer").html "<%= escape_javascript(render partial: 'activities/reset_link', locals: { activity_id: @pomodoro.activity.id, pomodoro_id: @pomodoro.id }) %>"
