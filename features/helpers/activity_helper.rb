module ActivityHelper
  def create_activity(title = "Check email")
    Activity.create! title: title
  end

  def create_activities
    @activities = 5.times.collect { |i| create_activity("Activity_#{i}") }
  end

  def activities_from_table(activities)
    @activities ||= activities.hashes.collect { |activity| Activity.create! activity }
  end

  def activities
    @activities ||= []
  end

  def activity
    @activity ||= create_activity
  end

  def valid_attributes
    { title: "Check email" }
  end
end

