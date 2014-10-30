require 'sinatra'

get '/free' do
  headers['Content-Type'] = 'text/plain; charset=utf-8'
  @command_r = `free -m`
  erb :free
end

get '/df' do
  headers['Content-Type'] = 'text/plain; charset=utf-8'
  @command_m = `df -h`
  erb :df
end
