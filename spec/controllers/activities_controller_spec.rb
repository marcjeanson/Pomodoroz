require 'spec_helper'

describe ActivitiesController do
  context "get .index" do
    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should assign_to(:activities) }
  end

  context "get .new" do
    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should assign_to(:activity) }
  end

end
