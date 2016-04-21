class Student < User
  # attr_accessible :first_name, :last_name
  has_many :progresses, dependent: :destroy
  has_many :courses
  has_many :teachers, through: :courses, class_name: "User"

  validates :first_name, presence: true
  validates :last_name, presence: true

  # def full_name
  #   "#{first_name} #{last_name}"
  # end

  def progress_status
    # return max progress made by the student
    progresses.sort_by {|pr| [pr.lesson, pr.part]}.last
  end

  def show_progress
    # just for fun
    prg = progress_status
    progress_visual = prg.progress_to_int.times.map{|i| i+=1; i%3 == 0 ? "#{i/3}" : '.'}.join
    " completed #{prg.lesson} Lessons #{prg.part} Parts. [#{progress_visual}]"
  end

end
