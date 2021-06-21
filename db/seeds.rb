# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    { username: 'user1',
      password: 'user1_p',
      firstname: 'user1_f',
      role: 2,
      lastname: 'user1_l' },
    { username: 'user2',
      password: 'user2_p',
      firstname: 'user2_f',
      role: 1,
      lastname: 'user2_l' },
    { username: 'user3',
      password: 'user3_p',
      firstname: 'user3_f',
      role: 1,
      lastname: 'user3_l' }
  ]
)

categories = Category.create!(
  [
    { title: 'frontend' },
    { title: 'backend' },
    { title: 'ruby' }
  ]
)

tests = Test.create!(
  [
    { title: 'html',
      level: 0,
      category: categories[0],
      author: users[0] },
    { title: 'css',
      level: 0,
      category: categories[0],
      author: users[1] },
    { title: 'ruby',
      level: 1,
      category: categories[2],
      author: users[2] }
  ]
)

questions = Question.create!(
  [
    { body: ' What html is?',
      test: tests[0] },
    { body: ' What css is?',
      test: tests[1] },
    { body: ' What ruby is?',
      test: tests[2] }
  ]
)

Answer.create!(
  [
    { body: 'html',
      correct: true,
      question: questions[0] },
    { body: 'not html',
      question: questions[0] },
    { body: 'css',
      correct: true,
      question: questions[1] },
    { body: 'not css',
      correct: true,
      question: questions[1] },
    { body: 'ruby',
      correct: true,
      question: questions[2] },
    { body: 'not ruby',
      question: questions[2] }
  ]
)

TestsUser.create!(
  [
    { user: users[0],
      test: tests[0] },
    { user: users[1],
      test: tests[0] },
    { user: users[1],
      test: tests[1] },
    { user: users[2],
      test: tests[2] }
  ]
)
