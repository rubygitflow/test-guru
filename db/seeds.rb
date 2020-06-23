# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{name: "Admin", email: "admin@gmail.com", 
                       password: '123456', type: "Admin",
                       last_name: 'Lastmin'}, 
                      {name: "User", email: "user@gmail.com", 
                       password: '123456', type: "User",
                       last_name: 'Laster'}])

category_sections = %w[Ruby RoR JavaScript React HTML CSS]
categories = []
category_sections.each do |section|
  categories << Category.create!(title: section)
end


tests_data = [
  {title: 'Ruby beginner', level: 1, category_id: categories[0].id, author_id: users[0].id},
  {title: 'Ruby master', level: 3, category_id:  categories[0].id, author_id: users[0].id},
  {title: 'RoR beginner', level: 1, category_id:  categories[1].id, author_id: users[0].id},
  {title: 'RoR master', level: 3, category_id:  categories[1].id, author_id: users[0].id},
  {title: 'JavaScript programmer', level: 2, category_id:  categories[2].id, author_id: users[0].id},
  {title: 'React programmer', level: 3, category_id:  categories[2].id, author_id: users[0].id},
  {title: 'HTML coder', level: 1, category_id:  categories[3].id, author_id: users[0].id},
  {title: 'CSS designer', level: 2, category_id:  categories[4].id, author_id: users[0].id}
]

tests = []
tests_data.each do |test_data|
  tests << Test.create!(test_data)
end


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
