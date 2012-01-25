class ApplicationController < ActionController::Base
  POMODORO_LENGTH = 1500

  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :current_pomodoro
  helper_method :pomodoro_length_in_minutes
  helper_method :pomodoro_length_in_seconds

  def pomodoro_length_in_minutes
    (POMODORO_LENGTH / 60).truncate
  end

  def pomodoro_length_in_seconds
    POMODORO_LENGTH
  end

  private
  def record_not_found
    render text: "Sorry, we couldn't find that record for you.", status: 404
  end

  def current_pomodoro
    @pomodoro = Pomodoro.where("reset_at is null and completed_at is null and created_at > ?", POMODORO_LENGTH.seconds.ago).first
    @time_left = POMODORO_LENGTH - (Time.zone.now - @pomodoro.created_at).truncate if @pomodoro
  end
end
