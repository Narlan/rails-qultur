def print_the_final_QR
  puts "\n\n▄▄▄▄▄▄▄  ▄  ▄▄  ▄ ▄▄  ▄▄▄ ▄▄▄▄▄▄▄
█ ▄▄▄ █ ▄▄█▀█▄█▀█ ██▀▀▄▀  █ ▄▄▄ █
█ ███ █  ▀█▀ ▀█▀  ▄▄  █▄▄ █ ███ █
█▄▄▄▄▄█ ▄▀▄ ▄▀▄ ▄▀▄▀▄▀▄▀█ █▄▄▄▄▄█
▄▄▄ ▄▄▄▄█▀█▄▀▀█▄▀█ ▀▄█▀██▄▄   ▄
▄▄ ▄▀ ▄▀▀▄▀▀ ▄▀▀ ▀▀ ▄   ▀▄█ ▄▄▀██
▀ ▀▀▀█▄▀█  ▀▄  ▀▄█   ██▀▄▄▄▄    █
▄██  ▄▄▀█▀ ██▀▄██ ▄ ▀▀▄ █ ▄ ▄▄███
██▀█ ▄▀ █ ▄▀▀█▄██ ▀██ ▀█▀█ ▀  █
▄▀▄ █ ▄ ▀█▀▀ ▄▀▀ ▀  █▀▀ ▀▀█▄▄▄▄██
▀▀▀█  ▄▄▀ █▀▄  ▀▄██▀▀█ ▀▄ ▄▄ ▀ ▄▄
▄ ▀  █▄▀▄▀ ██▀▄ ▄▀▄ ▀ ▄▀█▀█▄▄▀▄██
▄▀▀▄▀▀▄█▄ ▀▄▀▀█▀██   █ ▀▄█▄█▄  ▄█
▄▄▄▄▄▄▄ ██ ▀ ▄▀ ██▀ ▀▀ ██ ▄ █▄▀▄▄
█ ▄▄▄ █ █▀ ▀▄  ███▀▀▄██▀█▄▄▄█  ▄█
█ ███ █ ▄▀▀██▀▄ █▄  ▀▀▄█  ▄▄▄ ▀ █
█▄▄▄▄▄█ █▄▀▄▀▀█  █▀███ ▀███▀▄▀ █▄\n\n\n"
end

def creation_validation(feed, state = "start")
  print "#{"Creating #{feed}" if state == 'start'}"
end

def clear
  system "cls"
  system "clear"
end

def print_user_informations
  print "\n\n"
  print "   email:".colorize(:color => :white, :background => :red)
  print "          user@example.com\n".colorize(:color => :black, :background => :white)
  print "password:".colorize(:color => :white, :background => :red)
  print "                  password".colorize(:color => :black, :background => :white)
  print "\n\n\n"
end

def print_adaptative_info(feed = nil, state = "done")
  if state == "start"
    statement = "Creating #{feed}"
    print statement
    count = statement.length
    while count < 29
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
