module ActivityHelper
  def create_activities
    @activities = 5.times.collect { |i| Activity.create! title: "Activity_#{i}" }
  end

  def activities_from_table(activities)
    @activities ||= activities.hashes.collect { |activity| Activity.create! activity }
  end

  def activities
    @activities ||= []
  end
end

