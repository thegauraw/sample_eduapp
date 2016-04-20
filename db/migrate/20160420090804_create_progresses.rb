class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.references :student
      t.integer :lesson
      t.integer :part

      t.timestamps
    end
    add_index :progresses, :student_id
  end
end
