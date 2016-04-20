require 'rails_helper'

RSpec.describe Progress, :type => :model do
  let!(:progress){ Progress.create(lesson: 5, part: 2)}

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

  describe '#progress_to_int' do
    subject {progress.progress_to_int }
    it "returns integer value of progress" do
      expect(subject).to eql(14)
    end
  end


end
