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
                       { name: 'Антон', email: 'buianoff-anton@yandex.ru' },
                       { name: 'Юрий', email: 'uri_dev@mail.ru' },
                       { name: 'Петр', email: 'petr_sidorov@mail.ru' }
                     ])

categories = Category.create!([
                       { title: 'Frontend' },
                       { title: 'Backend' },
                       { title: 'Machine Learning' }
                     ])

tests = Test.create!([
                       { title: 'Ruby', level: 3, category: categories[1], author: users[0] },
                       { title: 'Python', level: 2, category: categories[0], author: users[1] },
                       { title: 'JavaScript', level: 1, category: categories[0], author: users[2] }
                     ])

questions = Question.create!([
                               { body: 'Вопрос 1', test: tests[0]},
                               { body: 'Вопрос 2', test: tests[0]},
                               { body: 'Вопрос 1', test: tests[1]},
                               { body: 'Вопрос 2', test: tests[1]},
                               { body: 'Вопрос 1', test: tests[2]},
                               { body: 'Вопрос 2', test: tests[2]},
                             ])

Answer.create!([
                 { body: 'Ответ 1', question: questions[0], correct: false },
                 { body: 'Ответ 2', question: questions[0], correct: true },
                 { body: 'Ответ 3', question: questions[0], correct: false },
                 { body: 'Ответ 1', question: questions[1], correct: true },
                 { body: 'Ответ 2', question: questions[1], correct: false },
                 { body: 'Ответ 3', question: questions[1], correct: false },
                 { body: 'Ответ 1', question: questions[2], correct: false },
                 { body: 'Ответ 2', question: questions[2], correct: false },
                 { body: 'Ответ 3', question: questions[2], correct: true },
                 { body: 'Ответ 1', question: questions[3], correct: true },
                 { body: 'Ответ 2', question: questions[3], correct: false },
                 { body: 'Ответ 3', question: questions[3], correct: false },
                 { body: 'Ответ 1', question: questions[4], correct: false },
                 { body: 'Ответ 2', question: questions[4], correct: true },
                 { body: 'Ответ 3', question: questions[4], correct: false },
                 { body: 'Ответ 1', question: questions[5], correct: false },
                 { body: 'Ответ 2', question: questions[5], correct: true },
                 { body: 'Ответ 3', question: questions[5], correct: false }
               ])
