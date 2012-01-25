require 'spec_helper'

describe Activity do
  it { should validate_presence_of(:title) }
  it { should have_db_column(:completed).of_type(:boolean) }
end
