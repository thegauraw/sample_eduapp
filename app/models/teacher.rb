class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :courses
  has_many :students, through: :courses
  has_many :progresses, through: :students

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
