require 'rails_helper'

RSpec.describe Progress, :type => :model do
  let!(:student){ Student.create(first_name: "Gauraw", last_name: "Rijal")}
  let!(:progress){ student.progresses.create!(lesson: 1, part: 1)}

  it "must have lesson" do
    expect{student.progresses.create!(part: 1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have part" do
    expect{student.progresses.create!(lesson: 1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have student_id" do
    expect{Progress.create!(lesson: 1, part: 1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "lesson cannot be more than 100" do
    expect{student.progresses.create!(lesson: 101, part:1)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "part cannot be more than 3" do
    expect{student.progresses.create!(lesson: 1, part:5)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe '#progress_to_int' do
    subject {progress.progress_to_int }
    it "returns integer value of progress" do
      expect(subject).to eql(1)
    end
  end

  describe '#get_latest' do
    before do
      @progress = student.progresses.create!(lesson: 1, part: 2)
    end

    subject {progress.reload.get_latest }
    it "returns latest progress of associated student" do
      expect(subject).to eql(@progress)
    end
  end


end
