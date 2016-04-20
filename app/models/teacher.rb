class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :courses
  has_many :students, through: :courses
end
