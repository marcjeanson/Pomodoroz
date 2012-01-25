require 'spec_helper'

describe Pomodoro do
  it { should belong_to(:activity) }
  it { should validate_presence_of(:activity_id) }
end
