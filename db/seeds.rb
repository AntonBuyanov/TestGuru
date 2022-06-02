# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Category.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
UserPassedTest.destroy_all

users = User.create!([
                       { name: 'Антон' },
                       { name: 'Юрий' },
                       { name: 'Петр' }
                     ])

categories = Category.create!([
                       { title: 'Frontend' },
                       { title: 'Backend' },
                       { title: 'Machine Learning' }
                     ])

tests = Test.create!([
                       { title: 'Ruby', level: 3, category_id: categories[1].id, author_id: users[0].id },
                       { title: 'Python', level: 2, category_id: categories[0].id, author_id: users[1].id },
                       { title: 'JavaScript', level: 1, category_id: categories[0].id, author_id: users[2].id }
                     ])

questions = Question.create!([
                               { body: 'Вопрос 1', test_id: tests[0].id},
                               { body: 'Вопрос 2', test_id: tests[0].id},
                               { body: 'Вопрос 1', test_id: tests[1].id},
                               { body: 'Вопрос 2', test_id: tests[1].id},
                               { body: 'Вопрос 1', test_id: tests[2].id},
                               { body: 'Вопрос 2', test_id: tests[2].id},
                             ])

Answer.create!([
                 { body: 'Ответ 1', question_id: questions[0].id, correct: false },
                 { body: 'Ответ 2', question_id: questions[0].id, correct: true },
                 { body: 'Ответ 3', question_id: questions[0].id, correct: false },
                 { body: 'Ответ 1', question_id: questions[1].id, correct: true },
                 { body: 'Ответ 2', question_id: questions[1].id, correct: false },
                 { body: 'Ответ 3', question_id: questions[1].id, correct: false },
                 { body: 'Ответ 1', question_id: questions[2].id, correct: false },
                 { body: 'Ответ 2', question_id: questions[2].id, correct: false },
                 { body: 'Ответ 3', question_id: questions[2].id, correct: true },
                 { body: 'Ответ 1', question_id: questions[3].id, correct: true },
                 { body: 'Ответ 2', question_id: questions[3].id, correct: false },
                 { body: 'Ответ 3', question_id: questions[3].id, correct: false },
                 { body: 'Ответ 1', question_id: questions[4].id, correct: false },
                 { body: 'Ответ 2', question_id: questions[4].id, correct: true },
                 { body: 'Ответ 3', question_id: questions[4].id, correct: false },
                 { body: 'Ответ 1', question_id: questions[5].id, correct: false },
                 { body: 'Ответ 2', question_id: questions[5].id, correct: true },
                 { body: 'Ответ 3', question_id: questions[5].id, correct: false }
               ])
