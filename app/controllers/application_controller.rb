require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true 
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true 
    register Sinatra::Flash  
  end

  get "/" do
    erb :welcome
  end

  
end



# corneal scaffold User dev_username:string password_digest:string   

# corneal scaffold Application title:string description:text github_link:string dev_id:integer
