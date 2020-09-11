require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'  #sets a folder to public 
    set :views, 'app/views'  #sets views directory 
    set :sessions, true #enables sessions 
    set :session_secret, ENV["SESSION_SECRET"] #used with generating a session secret 
    set :method_override, true  #allows us to use hidden methods 
    register Sinatra::Flash  #Used for temporarily messaging saving to show to the user 
  end

  get "/" do
    @applications = Application.all
    erb :"/applications/index.html" 
  end

  # not_found do 
  #   flash[:error] = "Sorry, can't find that route"
  #   redirect "/applications" 
  # end 

  private 

  def current_user    #Finds a use based on their session id 
    User.find_by_id(session[:id])
  end 

  def logged_in?  #checks if the user is logged in. Prevents nil response. 
    !!current_user 
  end 

  def redirect_if_not_logged_in   #redirects user to the previous page 
      if !logged_in? 
          flash[:error] = "You must be logged in to view that page"
          redirect request.referrer || "/login"
      end  
  end 
end