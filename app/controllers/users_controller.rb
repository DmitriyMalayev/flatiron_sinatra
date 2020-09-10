class UsersController < ApplicationController

  get "/users/new" do 
    erb :"users/new" 
  end 

  post '/users' do 
    @user = User.new(dev_username: params[:dev_username], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/"
    else 
      erb :"users/new" 
    end
  end
end

#Provides a form for a User to make an account 
#Uses validations to check if all fields are properly filled out 
#Doesn't save if validations don't pass 
#Assigns session[:id] based on the User's id 