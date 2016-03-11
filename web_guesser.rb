require 'sinatra'
require 'sinatra/reloader'

number = rand(99) + 1

get '/' do
  "The SECRET number is #{number}"
end
