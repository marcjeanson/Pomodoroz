require 'spec_helper'

describe ActivitiesController do
  let!(:activity) { stub_model(Activity) }

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
        Activity.stub(:new).with('title' => 'Check twitter').and_return(activity)
        activity.stub(:save).and_return(true)
        post :create, activity: { title: "Check twitter" }
      end

      it { should redirect_to(activities_path) }
      it { should set_the_flash.to(I18n.t("flash.notices.activity_created")) }
    end

    context "with invalid activity data"
      before do
        Activity.stub(:new).and_return(activity)
        activity.stub(:save).and_return(false)
        post :create
      end

      it { should render_template(:new) }
      it { should set_the_flash.now.to(I18n.t("flash.errors.activity_save")) }
  end

  context "get .edit" do
    context "when the activity is found" do
      before do
        Activity.stub(:find).with('1').and_return(activity)
        get :edit, :id => 1
      end

      it { should render_template(:edit) }
      it { should assign_to(:activity) }
    end

    context "when the activity is not found" do
      before do
        Activity.stub(:find).with('99').and_raise(ActiveRecord::RecordNotFound)
        get :edit, :id => 99
      end

      it { should respond_with(:not_found) }
      it { should_not assign_to(:activity) }
    end
  end

  context "put .update" do
    context "when the activity is found" do
      before do
        Activity.stub(:find).with('1').and_return(activity)
        activity.stub(:update_attributes).and_return(true)
        put :update, :id => 1, :activity => { title: "the new title" }
      end

      it { should redirect_to(activities_path) }
      it { should set_the_flash.to(I18n.t("flash.notices.activity_updated")) }
    end

    context "when the activity is not found" do
      before do
        Activity.stub(:find).with('1').and_raise(ActiveRecord::RecordNotFound)
        activity.should_not_receive(:update_attributes)
        put :update, :id => 1, :activity => { title: "the new title" }
      end

      it { should respond_with(:not_found) }
    end

  end

  context "delete .destroy" do
    context "when the activity is found" do
      before do
        Activity.stub(:find).with('1').and_return(activity)
        activity.should_receive(:destroy)
        delete :destroy, :id => 1
      end

      it { should redirect_to(activities_path) }
      it { should set_the_flash.to(I18n.t("flash.notices.activity_deleted")) }
    end

    context "when the activity is not found" do
      before do
        Activity.stub(:find).with('1').and_raise(ActiveRecord::RecordNotFound)
        activity.should_not_receive(:destroy)
        delete :destroy, :id => 1
      end

      it { should respond_with(:not_found) }
    end
  end
end
