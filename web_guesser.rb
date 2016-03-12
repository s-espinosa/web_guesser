require 'sinatra'
require 'sinatra/reloader'

set :secret_number, rand(100)

get '/' do
  guess = params["guess"]
  message, background = check_guess(guess)
  erb :index, :locals => {:number => settings.secret_number, :message => message, :background => background}
end

def check_guess(guess)
  if guess.nil?
    ""
  elsif guess.to_i == settings.secret_number
    ["That's correct!", "#337733"]
  elsif guess.to_i > settings.secret_number + 5
    ["That guess is way too high", "#aa3333"]
  elsif guess.to_i < settings.secret_number - 5
    ["That guess is way too low", "#aa3333"]
  elsif guess.to_i > settings.secret_number
    ["That guess is too high", "#aa8888"]
  else
    ["That guess is too low", "#aa8888"]
  end
end
