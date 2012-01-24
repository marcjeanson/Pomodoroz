module ActivityHelper
  def activities
    @activities ||= []
  end

  def activities_from_table(activities)
    @activities ||= activities.hashes.collect { |activity| Activity.create! activity }
  end
end

