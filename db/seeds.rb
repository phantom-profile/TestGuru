# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
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

Category.create!(
  [
    { title: 'frontend' },
    { title: 'backend' },
    { title: 'ruby' }
  ]
)

Test.create!(
  [
    { title: 'html',
      level: 0,
      category_id: 1,
      author_id: 1 },
    { title: 'css',
      level: 0,
      category_id: 1,
      author_id: 2 },
    { title: 'ruby',
      level: 1,
      category_id: 3,
      author_id: 3 }
  ]
)

Question.create!(
  [
    { body: ' What html is?',
      test_id: 1 },
    { body: ' What css is?',
      test_id: 2 },
    { body: ' What ruby is?',
      test_id: 3 }
  ]
)

Answer.create!(
  [
    { body: 'html',
      correct: true,
      question_id: 1 },
    { body: 'not html',
      question_id: 1 },
    { body: 'css',
      correct: true,
      question_id: 2 },
    { body: 'not css',
      correct: true,
      question_id: 2 },
    { body: 'ruby',
      correct: true,
      question_id: 3 },
    { body: 'not ruby',
      question_id: 3 }
  ]
)

TestsUser.create!(
  [
    { user_id: 1,
      test_id: 1 },
    { user_id: 2,
      test_id: 1 },
    { user_id: 2,
      test_id: 2 },
    { user_id: 3,
      test_id: 3 }
  ]
)
