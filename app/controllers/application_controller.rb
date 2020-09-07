require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
end



# corneal scaffold User dev_username:string password_digest:string   

# corneal scaffold Application title:string description:text github_link:string dev_id:integer
