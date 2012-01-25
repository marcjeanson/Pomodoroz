class Pomodoro < ActiveRecord::Base
  belongs_to :activity

  validates :activity_id, presence: true

  def complete!
    self.update_attribute :completed_at, Time.now
  end
end
