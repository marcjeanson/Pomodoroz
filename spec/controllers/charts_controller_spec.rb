require 'spec_helper'

describe ChartsController do

  describe "#show" do
    let(:today) { Date.parse('2012-01-10') }
    let(:sda)   { today - 6 }
    let(:days)  { (sda..today) }
    let(:completed) { days.map { |d| stub_model(Pomodoro, completed_at: d) } }
    let(:reset) { days.map { |d| stub_model(Pomodoro, reset_at: d) } }

    before do 
      controller.stub(:current_pomodoro)
      Date.stub(:today).and_return(today)
      Pomodoro.stub(:where).with("completed_at >= '#{sda}'").and_return(completed)
      Pomodoro.stub(:where).with("reset_at >= '#{sda}'").and_return(reset)
      get :show
    end
    
    it { should respond_with(:success) }
    it { should render_template(:show) }
    it { should assign_to(:dates).with(days) }
    it { should assign_to(:completed).with([1, 1, 1, 1, 1, 1, 1]) }
    it { should assign_to(:reset).with([1, 1, 1, 1, 1, 1, 1]) }
  end

end
