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
      category_id: categories[0].id,
      author_id: users[0].id },
    { title: 'css',
      level: 0,
      category_id: categories[0].id,
      author_id: users[1].id },
    { title: 'ruby',
      level: 1,
      category_id: categories[2].id,
      author_id: users[2].id }
  ]
)

questions = Question.create!(
  [
    { body: ' What html is?',
      test_id: tests[0].id },
    { body: ' What css is?',
      test_id: tests[1].id },
    { body: ' What ruby is?',
      test_id: tests[2].id }
  ]
)

Answer.create!(
  [
    { body: 'html',
      correct: true,
      question_id: questions[0].id },
    { body: 'not html',
      question_id: questions[0].id },
    { body: 'css',
      correct: true,
      question_id: questions[1].id },
    { body: 'not css',
      correct: true,
      question_id: questions[1].id },
    { body: 'ruby',
      correct: true,
      question_id: questions[2].id },
    { body: 'not ruby',
      question_id: questions[2].id }
  ]
)

TestsUser.create!(
  [
    { user_id: users[0].id,
      test_id: tests[0].id },
    { user_id: users[1].id,
      test_id: tests[0].id },
    { user_id: users[1].id,
      test_id: tests[1].id },
    { user_id: users[2].id,
      test_id: tests[2].id }
  ]
)
