require 'sinatra'
require 'sinatra/reloader'

@@secret_number = rand(100)
@@guesses_remaining = 5

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message, background = check_guess(guess)

  @@guesses_remaining == 0 ? new_number : @@guesses_remaining -= 1

  erb :index, :locals => {:num => @@secret_number, :message => message, :background => background, :cheat => cheat}
end

def check_guess(guess)
  if guess.nil?
    ["", "#FFFFFF"]
  elsif guess.to_i == @@secret_number
    new_number
    ["That's correct!", "#337733"]
  elsif guess.to_i > @@secret_number + 5
    ["That guess is way too high", "#aa3333"]
  elsif guess.to_i < @@secret_number - 5
    ["That guess is way too low", "#aa3333"]
  elsif guess.to_i > @@secret_number
    ["That guess is too high", "#aa8888"]
  else
    ["That guess is too low", "#aa8888"]
  end
end

def new_number
  @@secret_number = rand(100)
  @@guesses_remaining = 5
end
