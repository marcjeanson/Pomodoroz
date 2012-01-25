class Activity < ActiveRecord::Base
  has_many :pomodoros, dependent: :destroy
  validates :title, presence: true
end
