class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :student
      t.references :teacher
    end
    add_index :courses, :student_id
    add_index :courses, :teacher_id
  end
end
