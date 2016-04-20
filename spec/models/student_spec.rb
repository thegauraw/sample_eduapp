require 'rails_helper'

RSpec.describe Student, :type => :model do
  let!(:student){ Student.create(first_name: "Gauraw", last_name: "Rijal")}

  it "must have first_name" do
    expect{Student.create!(last_name:'Rijal')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have last_name" do
    expect{Student.create!(first_name:'Gauraw')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe '#full_name' do
    subject {student.full_name }
    it "returns first_name last_name" do
      expect(subject).to eql("Gauraw Rijal")
    end
  end

  describe '#progress_status' do
    before do
      @progress1 = student.progresses.create(lesson:1, part:1)
      @progress2 = student.progresses.create(lesson:1, part:2)
    end

    subject {student.progress_status }
    it "returns max progress made by the student" do
      expect(subject).to eql(@progress2)
    end
  end

end
