class Progress < ActiveRecord::Base
  MAX_LESSON = 100
  MAX_PART = 3

  belongs_to :student, class_name: "User"
  attr_accessible :lesson, :part

  validates :lesson, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_LESSON}
  validates :part, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_PART}
  validates :student, presence: true
  validates_with SequentialCompletionValidator

  def progress_to_int
    (lesson.to_i-1)*Progress::MAX_PART + part.to_i
  end

  def get_latest
    student.try(:progress_status)
  end

end
