# basic sample data to start with

if Rails.env.development?
  tables = ['students', 'progresses']
  tables.each do |table|
    # truncate sqlite
    ActiveRecord::Base.connection.execute("DELETE FROM #{table};")
    ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='#{table}';")
  end
  # Student.delete_all

  student1 = Student.create(first_name: 'Foo', last_name: 'Bar')
  student2 = Student.create(first_name: 'Baz', last_name: 'Qux')
  student3 = Student.create(first_name: 'Garply', last_name: 'Waldo')

  student1.progresses.create(lesson: 1, part:1)
  sleep(1)
  student1.progresses.create(lesson: 1, part:2)

  sleep(1)
  student2.progresses.create(lesson: 1, part:1)
  sleep(1)
  student2.progresses.create(lesson: 1, part:2)

  teacher1 = Teacher.create(first_name: 'Norf', last_name: 'Quux')
  teacher2 = Teacher.create(first_name: 'Corge', last_name: 'Grault')

  teacher1.students = [student1, student2]
  teacher2.students = [student2, student3]
end
