class SessionsController < ApplicationController 

    get "/login" do  
        erb :"/sessions/login"
    end 

    post "/login" do 
        developer = User.find_by(dev_username: params[:dev_username])
        if developer && developer.authenticate(params[:password])
            session[:id] = developer[:id]
            redirect "/"
        else 
            @error = "Incorrect username or password" 
            erb :"/sessions/login"
        end 
    end

    delete "/logout" do 
        session.clear 
        redirect "/"
    end 
end 

