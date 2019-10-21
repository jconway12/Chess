# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "Please enter a numerical character, like '8' ."
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  # elsif maybe_fruit == "coffee"
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError 
    offering = gets.chomp
    if offering == "coffee"
      retry
    else
      puts "Go away."
    end
  end 
end  

class FriendshipTooYoung < StandardError; end
class InvalidName < StandardError; end
class NoPastime < StandardError; end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise FriendshipTooYoung if yrs_known < 5
    raise InvalidName if name.length <= 0
    raise NoPastime if fav_pastime.length <= 0
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


