class Activity < ActiveRecord::Base
  validates :title, presence: true
end
