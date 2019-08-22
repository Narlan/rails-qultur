require_relative 'seeds_auxiliary_data.rb'
require_relative 'seeds_auxiliary_ui.rb'

def create_monuments(monuments)
  monuments.each_value do |value|
    Monument.create!(value)
  end
end

def create_questions(questions)
  questions.each_value do |value|
    Question.create!(value)
  end
end

def create_answers(answers)
  answers.each_value do |value|
    Answer.create!(value)
  end
end

def create_user
  print_adaptative_info("1 user", "start")
  user = User.create!(
    first_name: "John",
    last_name: "Doe",
    nickname: "Jedi",
    age: 30,
    email: "user@example.com",
    password: "password",
    description: "J'adore voyager! J'ai visité le Japon, les Philippines, la Thaïlande, le Pérou et les Îles Fidji. Je suis actuellement à Bordeaux pour mes études.",
    remote_photo_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ137OO1cEyky0WKe3HS3KZpkDjk1Ex06k-CaX0K_TiCIre5XTiYg")
  print_adaptative_info()
end

def create_datas
  print_adaptative_info("#{monuments.length} monument(s)", "start")
  create_monuments(monuments)
  print_adaptative_info()

  print_adaptative_info("#{questions.length} question(s)", "start")
  create_questions(questions)
  print_adaptative_info()

  print_adaptative_info("#{answers.length} answers(s)", "start")
  create_answers(answers)
  print_adaptative_info()
end

def create_captured_hunts
  print_adaptative_info("2 hunts for test user", "start")
  user = User.where("nickname = 'Jedi'")[0]
  Hunt.create(score: 6, progress: "finish", monument: Monument.first, user: user)
  Hunt.create(score: 7, progress: "finish", monument: Monument.last, user: user)
  print_adaptative_info()
end

clear
print_the_final_QR
create_user
create_datas
create_captured_hunts
print_user_informations
