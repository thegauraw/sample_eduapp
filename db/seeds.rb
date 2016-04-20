# basic sample data to start with

Student.delete_all

student1 = Student.create(first_name: 'Foo',
  last_name: 'Bar'
  )

student2 = Student.create(first_name: 'Baz',
  last_name: 'Qux'
  )

student1.progresses.create(lesson: 1, part:1)
student1.progresses.create(lesson: 1, part:2)

student1.progresses.create(lesson: 1, part:1)
student1.progresses.create(lesson: 1, part:2)
