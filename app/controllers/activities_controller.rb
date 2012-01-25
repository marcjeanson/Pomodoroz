class ActivitiesController < ApplicationController
  before_filter :find_activity, :only => [:edit, :update, :destroy]

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(params[:activity])

    if @activity.save
      redirect_to activities_path, notice: t("flash.notices.activity_created")
    else
      flash.now[:error] = t("flash.errors.activity_save")
      render :new
    end
  end

  def edit
  end

  def update
    if @activity.update_attributes(params[:activity])
      redirect_to activities_path, notice: t("flash.notices.activity_updated")
    else
      flash.now[:error] = t("flash.errors.activity_save")
      render :edit
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_path, notice: t("flash.notices.activity_deleted")
  end

  private
  def find_activity
    @activity = Activity.find(params[:id])
  end
end
