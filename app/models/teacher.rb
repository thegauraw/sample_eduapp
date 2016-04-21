class Teacher < User
  # attr_accessible :first_name, :last_name
  has_many :courses
  has_many :students, through: :courses, class_name: "User"
  has_many :progresses, through: :students

  validates :first_name, presence: true
  validates :last_name, presence: true

  # def full_name
  #   "#{first_name} #{last_name}"
  # end

end
