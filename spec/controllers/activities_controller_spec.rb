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

  context "post .create" do
    context "with valid activity data" do
      before do
        post :create, activity: { title: "Check twitter" }
      end

      it { should redirect_to(activities_path) }
      it { should set_the_flash.to(I18n.t("flash.activity_created")) }
    end

    context "with invalid activity data"
  end

end
