# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{name: "admin", password: "qwerty"}, {name: "user", password: "12345"}])

category_sections = %w[Ruby RoR JavaScript React HTML CSS]
categories = []
category_sections.each do |section|
  categories << Category.create!(title: section)
end

tests = Test.create!([
  {title: 'Ruby beginner', level: 1, category: categories[0], author: User.first},
  {title: 'Ruby master', level: 3, category:  categories[0], author: User.first},
  {title: 'RoR beginner', level: 1, category:  categories[1], author: User.first},
  {title: 'RoR master', level: 3, category:  categories[1], author: User.first},
  {title: 'JavaScript programmer', level: 2, category:  categories[2], author: User.first},
  {title: 'React programmer', level: 3, category:  categories[2], author: User.first},
  {title: 'HTML coder', level: 1, category:  categories[3], author: User.first},
  {title: 'CSS designer', level: 2, category:  categories[4], author: User.first}
])


length = 50
questions = []
tests.each do |test|
  question_number = 1
  while question_number < 14 do
    questions << Question.create!(body: "#{rand(36**length).to_s(36)} ?", 
                                  test: test)
    question_number += 1
  end
end

length = 10
questions.each do |question|
  answer_count = 1
  while answer_count < 4
    random_boolean = 
    Answer.create!(body: "#{rand(16**length).to_s(16)}",
                   correct: [true, false].sample, 
                   question: question)
    answer_count += 1
  end
end
