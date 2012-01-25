module ActivityHelper
  ACTIVITIES_COUNT = 5

  def create_activity(title = "Check email")
    Activity.create! title: title
  end

  def create_activities
    @activities = ACTIVITIES_COUNT.times.collect { |i| create_activity("Activity_#{i+1}") }
  end

  def activities_from_table(activities)
    @activities ||= activities.hashes.collect { |activity| Activity.create! activity }
  end

  def activities
    @activities ||= create_activities
  end

  def activity
    @activity ||= activities[Random.rand(0..ACTIVITIES_COUNT-1)]
  end

  def valid_attributes
    { title: "Check email" }
  end
end

