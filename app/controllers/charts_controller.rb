class ChartsController < ApplicationController

  def show
    # summary last 7 days of finished vs reset
    sda = Date.today - 6
    completed = Pomodoro.where("completed_at >= '#{sda}'").group_by { |p| p.completed_at.to_date }  
    reset = Pomodoro.where("reset_at >= '#{sda}'").group_by { |p| p.reset_at.to_date }  
    
    @dates = (sda..Date.today)
    @completed = @dates.map { |d| completed[d].nil? ? 0 : completed[d].count }
    @reset = @dates.map { |d| reset[d].nil? ? 0 : reset[d].count }
  end

end
