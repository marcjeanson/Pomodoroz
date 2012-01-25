require 'spec_helper'

describe Activity do
  it { should have_many(:pomodoros).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should have_db_column(:completed).of_type(:boolean) }
end
