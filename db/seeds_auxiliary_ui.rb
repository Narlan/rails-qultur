def print_the_final_QR
  puts "\n\n   ____        _ _         _____
  / __ \\      | | |       |  __ \\
 | |  | |_   _| | |_ _   _| |__) |
 | |  | | | | | | __| | | |  _  /
 | |__| | |_| | | |_| |_| | | \\ \\
  \\___\\_\\\\__,_|_|\\__|\\__,_|_|  \\_\\

                                  \n\n"
end

def creation_validation(feed, state = "start")
  print "#{"Creating #{feed}" if state == 'start'}"
end

def clear
  system "cls"
  system "clear"
end

def print_user_informations
  print "\n\n          User                   email                password\n".colorize(:color => :white, :background => :red)
  print "  Paul Macaron".colorize(:color => :black, :background => :white)
  print "        user@example.com                password\n".colorize(:color => :black, :background => :white)
  print " Rebecca Wurst".colorize(:color => :black, :background => :white)
  print "    rebecca@caramail.com                password\n\n".colorize(:color => :black, :background => :white)
end

def print_adaptative_info(feed = nil, state = "done")
  if state == "start"
    statement = "Creating #{feed}"
    print statement
    count = statement.length
    while count < 34
      print(".")
      count += 1
    end
  else
    print " done!\n".green
  end
end

def print_dancers
  print "      〜(￣▽￣〜) (〜￣▽￣)〜\n\n\n"
end

def backspace(times)
  times.times { print "\b \b" }
end
