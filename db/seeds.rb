user = User.where(name: 'architect').take

category_sections = %w[Ruby RoR JavaScript React HTML CSS]
categories = []
category_sections.each do |section|
  category = Category.where(title: section).take
  unless category
    category = Category.create!(title: section)
    categories << category
  end
  Badge.create!(rule: Badge::Rule::CATEGORY,
                title: "Expert #{category.title}",
                image_path: Badge::Rule::DEF_IMAGE_CATEGORY,
                value: category.id)
end

levels = [0, 1, 2 ,3 ]
levels.each do |level|
  Badge.create!(rule: Badge::Rule::LEVEL,
                title: "GRADE #{level}",
                image_path: Badge::Rule::DEF_IMAGE_LEVEL,
                value: level)
end

Badge.create!(rule: Badge::Rule::FIRST_ATTEMPT,
              title: "STAR",
              image_path: Badge::Rule::DEF_IMAGE_FIRST_ATTEMPT)


if user 
  tests_data = [
    {title: 'Ruby beginner', level: 1, category_id: categories[0].id, author_id: user.id},
    {title: 'Ruby master', level: 3, category_id:  categories[0].id, author_id: user.id},
    {title: 'RoR beginner', level: 1, category_id:  categories[1].id, author_id: user.id},
    {title: 'RoR master', level: 3, category_id:  categories[1].id, author_id: user.id},
    {title: 'JavaScript programmer', level: 2, category_id:  categories[2].id, author_id: user.id},
    {title: 'React programmer', level: 3, category_id:  categories[2].id, author_id: user.id},
    {title: 'HTML coder', level: 1, category_id:  categories[3].id, author_id: user.id},
    {title: 'CSS designer', level: 2, category_id:  categories[4].id, author_id: user.id}
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
end
