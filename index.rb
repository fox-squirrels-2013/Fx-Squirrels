require 'sinatra'

get '/' do 
	"hello friends"
	erb :index
end

