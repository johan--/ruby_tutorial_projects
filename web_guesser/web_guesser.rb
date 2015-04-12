require 'sinatra'
#require 'sinatra/reloader'

@@secret_number = rand(100)
@@number_of_guesses = 5

get '/' do
  number = @@secret_number
  guess = params["guess"]
  cheat = params["cheat"]
  message = "Start guessing a number"
  message = check_guess(guess) unless guess.nil?
  if message.include?("limit") || message.include?("right")
    @@number_of_guesses = 5
    @@secret_number = rand(100)
  end
  if cheat 
    message = "CHEAT CODE ACTIVATED: The number is #{@@secret_number}"
  end
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  @@number_of_guesses -= 1

  if @@number_of_guesses == 0
    return "Guess limit reached and generated a new number"
  end

  if guess.to_f == @@secret_number
    "You got it right! The SECRET NUMBER is #{@@secret_number}"
  elsif guess.to_f > (@@secret_number - 5) && guess.to_f < (@@secret_number + 5)
    guess.to_f < @@secret_number ? "Too low!" : "Too high!"
  elsif guess.to_f < @@secret_number
    "Way too low!"
  elsif guess.to_f > @@secret_number
    "Way too high!"
  else
    "Something went wrong."
  end
end
