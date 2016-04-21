require 'rails_helper'

RSpec.describe SequentialCompletionValidator, :type => :validator do
  let!(:student){ Student.create(first_name: "Gauraw", last_name: "Rijal")}
  let!(:progress){ student.progresses.create!(lesson: 1, part: 1)}


  context 'progress updated in wrong order' do
    subject { student.progresses.new(lesson: 1, part: 3) }
    it 'progress is invalid with lesson error' do
      expect{ subject.valid? }.to change{ subject.errors[:lesson] }.to include("lesson not completed in sequential order.")
    end
    it 'progress is invalid with part error' do
      expect{ subject.valid? }.to change{ subject.errors[:part] }.to include("part not completed in sequential order.")
    end
  end

  context 'progress updated in sequential order' do
    subject { student.progresses.new(lesson: 1, part: 2) }
    it 'progress is valid with no lesson error' do
        expect{ subject.valid? }.to_not change{ subject.errors[:lesson] }
    end
    it 'progress is valid with no part error' do
        expect{ subject.valid? }.to_not change{ subject.errors[:part] }
    end

  end
end
