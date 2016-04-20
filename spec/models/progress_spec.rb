require 'rails_helper'

RSpec.describe Progress, :type => :model do
  it "must have lesson" do
    expect{Progress.create!(part: 1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have part" do
    expect{Progress.create!(lesson: 1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "lesson cannot be more than 100" do
    expect{Progress.create!(lesson: 101, part:1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "part cannot be more than 3" do
    expect{Progress.create!(lesson: 1, part:5)}.to raise_error(ActiveRecord::RecordInvalid)
  end

end
