require_relative 'seeds_auxiliary_data.rb'
require_relative 'seeds_auxiliary_ui.rb'
require 'faker'

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

def create_user(descriptions)
    print_adaptative_info("1 active user", "start")
    user = User.create!(
      first_name: "Grumpy",
      last_name: "Grandpa",
      nickname: Faker::Ancient.god,
      age: 30,
      email: "user@example.com",
      password: "password",
      level: 1,
      exp: 0,
      description: "J'aime pas Noël ; je déteste les enfants et la joie de vivre me donne envie de vomir !",
      remote_photo_url: "https://i.imgur.com/g5DBPWB.png")
    print_adaptative_info()

    user = User.create!(
      first_name: "Rebecca",
      last_name: "Wurst",
      nickname: "Grumpy Unicorn",
      age: 30,
      email: "rebecca@caramail.com",
      password: "password",
      level: 1,
      exp: 0,
      description: "J'adore Paris ! <3 Je suis une jeune entrepreneuse en provenance de Berlin.",
      remote_photo_url: "https://static.lexpress.fr/medias_10890/w_960,h_540,c_fill,g_north/v1459781832/selfie-tour-eiffel_5576077.jpg")

    cpt = 1
    print_adaptative_info("#{descriptions.length} fake users", "start")
    descriptions.each do |description|
      print " [#{cpt} / #{descriptions.length}]"
      fake_user = User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        nickname: Faker::Esport.player,
        age: rand(18..42),
        email: Faker::Internet.free_email,
        password: "password",
        level: rand(1..20),
        exp: rand(0..10) * 10,
        description: description,
        remote_photo_url: "https://source.unsplash.com/featured/?face")
      cpt += 1
      # sleep(3)
      backspace(8)
    end
    print_adaptative_info
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

# def create_hunts_with_random_capture
#   print_adaptative_info("hunts for active user", "start")
#   user = User.find(1)
#   monuments = Monument.all.drop(1)
#   monuments.each do |monument|
#     hunt = Hunt.create(progress: 3, monument: monument, user: user)
#     hunt.monument.questions.each do |question|
#         choice = Choice.create(hunt: hunt, answer: question.answers.first, success: [true, false].sample)
#     end
#   end
#   print_adaptative_info()
# end

user_descriptions = fake_user_description()

clear
print_the_final_QR
create_user(user_descriptions)
create_datas
# create_hunts_with_random_capture
print_user_informations
