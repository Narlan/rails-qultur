require_relative 'seeds_auxiliary_data.rb'
require_relative 'seeds_auxiliary_ui.rb'

def create_monuments(monuments)
  monuments.each_value do |value|
    Monument.create!(value)
    puts "created #{value[:name]}"
  end
end

def create_questions(questions)
  questions.each_value do |value|
    Question.create!(value)
    puts "created #{value[:title]}"
  end
end

def create_answers(answers)
  answers.each_value do |value|
    Answer.create!(value)
    puts "created #{value[:content]}"
  end
end
print "Creating a user... "
user = User.create!(first_name: "John", last_name: "Doe", nickname: "Jedi", age: 30,
                   email: "user@example.com", password: "password",
                   photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ137OO1cEyky0WKe3HS3KZpkDjk1Ex06k-CaX0K_TiCIre5XTiYg(5 ko)
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ137OO1cEyky0WKe3HS3KZpkDjk1Ex06k-CaX0K_TiCIre5XTiYg
")
puts "done!"

puts "Creating #{monuments.length} monument(s)..."
create_monuments(monuments)
puts "... done!"

puts "Creating #{questions.length} question(s)..."
create_questions(questions)
puts "... done!"

puts "Creating #{answers.length} answer(s)..."
create_answers(answers)
puts "... done!"


system "clear"

puts "email: user@example.com"
puts "password: password"

print_the_final_QR
