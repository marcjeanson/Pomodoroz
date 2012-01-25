class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  before_filter :current_pomodoro

  private
  def record_not_found
    render text: "Sorry, we couldn't find that record for you.", status: 404
  end

  def current_pomodoro
    @pomodoro = Pomodoro.where("reset_at is null and completed_at is null and created_at > ?", 25.minutes.ago).first
    @time_left = 25 * 60 - (Time.zone.now - @pomodoro.created_at).truncate if @pomodoro
  end
end
