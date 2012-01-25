class Pomodoro < ActiveRecord::Base
  belongs_to :activity

  validates :activity_id, presence: true

  def completed?
    !completed_at.nil?
  end

  def complete!
    self.update_attribute :completed_at, Time.now
  end

  def reset!
    self.update_attribute :reset_at, Time.now
  end
end
