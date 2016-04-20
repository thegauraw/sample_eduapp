require 'rails_helper'

RSpec.describe Teacher, :type => :model do
  let!(:teacher){ Teacher.create(first_name: "Gauraw", last_name: "Rijal")}

  it "must have first_name" do
    expect{Teacher.create!(last_name:'Rijal')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have last_name" do
    expect{Teacher.create!(first_name:'Gauraw')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  describe '#full_name' do
    subject {teacher.full_name }
    it "returns first_name last_name" do
      expect(subject).to eql("Gauraw Rijal")
    end
  end

end
