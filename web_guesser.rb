require 'sinatra'
require 'sinatra/reloader'

set :secret_number, rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => settings.secret_number, :message => message}
end

def check_guess(guess)
  if guess.nil?
    ""
  elsif guess.to_i == settings.secret_number
    "That's correct!"
  elsif guess.to_i > settings.secret_number + 5
    "That guess is way too high"
  elsif guess.to_i < settings.secret_number - 5
    "That guess is way too low"
  elsif guess.to_i > settings.secret_number
    "That guess is too high"
  else
    "That guess is too low"
  end
end
