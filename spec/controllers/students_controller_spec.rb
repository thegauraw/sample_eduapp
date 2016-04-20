require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do

  describe "GET #index" do
    let!(:student) {Student.create(first_name: 'Gauraw', last_name: 'Rijal')}

    before do
      student.progresses.create(lesson:1, part:1)
      student.progresses.create(lesson:1, part:2)
    end

    it "returns JSON result" do
      get :report, id: student.id
      result = {first_name:"Gauraw",id:student.id,last_name:"Rijal",progresses:[{lesson:1,part:1},{lesson:1,part:2}]}.to_json
      expect(response.body).to eq(result)
    end
  end

end
