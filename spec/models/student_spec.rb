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

end
