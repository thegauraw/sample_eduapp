class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :progresses, dependent: :destroy
  has_many :courses
  has_many :teachers, through: :courses

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
