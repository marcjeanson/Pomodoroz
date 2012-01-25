require 'spec_helper'

describe PomodorosController do
  let(:activity) { stub_model(Activity, :id => 1) }
  let(:pomodoro) { stub_model(Pomodoro) }

  describe "post .create via ajax" do
    before do
      Activity.stub(:find).with(activity.id.to_s).and_return(activity)
      activity.stub_chain(:pomodoros, :create).and_return(pomodoro)
      xhr :post, :create, :activity_id => activity.id, :format => :js
    end

    it { should respond_with(:success) }
    it { should render_template(:create) }
  end
end
