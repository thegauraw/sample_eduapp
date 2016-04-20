require 'rails_helper'

RSpec.describe Student, :type => :model do
  it "must have first_name" do
    expect{Student.create!(last_name:'Rijal')}.to raise_error(ActiveRecord::RecordInvalid)
  end
  it "must have last_name" do
    expect{Student.create!(first_name:'Gauraw')}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
