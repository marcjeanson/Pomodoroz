require 'spec_helper'

describe Activity do
  it { should have_many(:pomodoros).dependent(:destroy) }
  it { should validate_presence_of(:title) }
end
