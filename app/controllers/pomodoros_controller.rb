class PomodorosController < ApplicationController
  respond_to :js
  before_filter :find_activity

  def create
    @pomodoro = @activity.pomodoros.create
  end

  def complete
    @pomodoro = @activity.pomodoros.find(params[:id])
    @pomodoro.complete!
  end

  private
  def find_activity
    @activity = Activity.find params[:activity_id]
  end
end
