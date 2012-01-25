class ActivitiesController < ApplicationController
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

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    redirect_to activities_path, notice: t("flash.notices.activity_deleted")
  end
end
