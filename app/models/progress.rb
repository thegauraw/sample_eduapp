class Progress < ActiveRecord::Base
  MAX_LESSON = 100
  MAX_PART = 3

  belongs_to :student
  attr_accessible :lesson, :part

  validates :lesson, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_LESSON}
  validates :part, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: MAX_PART}
end
