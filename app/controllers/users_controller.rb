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

