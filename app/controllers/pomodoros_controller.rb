class PomodorosController < ApplicationController
  respond_to :js

  def create
    @activity = Activity.find params[:activity_id]
    @pomodoro = @activity.pomodoros.create
  end
end
