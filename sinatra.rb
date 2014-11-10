require 'sinatra'
require 'mongoid'

configure do
  Mongoid.load!("./config/mongoid.yml")
end

class Info
  include Mongoid::Document
  field :memory, type: String
end

get '/' do
  erb :index
end

get '/free' do
  headers['Content-Type'] = 'text/plain; charset=utf-8'
  @memory = `free -m`
  Info.create(memory: @memory)
  erb :free
end

get '/df' do
  headers['Content-Type'] = 'text/plain; charset=utf-8'
  @processes = `df -h`
  erb :df
end

get '/stat' do
  headers['Content-Type'] = 'text/plain; charset=utf-8'
  @stat = Info.all.pluck(:memory)
  erb :stat
end
