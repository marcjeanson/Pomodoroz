class ChartsController < ApplicationController

  def show
    # summary daily, weekly, monthly
    Pomodoro.all
  end

end
