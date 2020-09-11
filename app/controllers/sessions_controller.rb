class SessionsController < ApplicationController 

    get "/login" do  #Renders User Log In Form 
        erb :"/sessions/login"
    end 

    post "/login" do  #Uses above info 
        developer = User.find_by_username(:dev_username)
        if developer && developer.authenticate(params[:password])
            session[:id] = developer[:id]
            redirect "/"
        else 
            @error = "Incorrect username or password" 
            erb :"/sessions/login"
        end 
    end
end 

#Provides the ability for the User to Log In 
#Checks if such a user exists 
#Authenticates the user 
#Uses the User's id to assign the session[:id]   (if authentication successful)
  