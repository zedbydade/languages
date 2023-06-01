require 'sinatra'
require 'mongoid'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

class User 
  include Mongoid::Document 

  field :name, type: String
end

get '/users' do 
  User.all.to_json
end

post '/users' do 
  user = User.create!(params[:user])
  user.to_json
end
