class UsersController < ApplicationController

  get "/users/new" do 
    erb :"users/new.html"
  end 

  post '/users' do 
    @user = User.new(dev_username: params[:dev_username], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/"
    else 
      erb :'users/new.html' 
    end
  end
end











#   # GET: /users
#   get "/users" do  
#     erb :"/users/index.html"
#   end

#   # GET: /users/new
#   get "/users/new" do
#     erb :"/users/new.html"
#   end

#   # POST: /users
#   post "/users" do
#     redirect "/users"
#   end

#   # GET: /users/5
#   get "/users/:id" do
#     erb :"/users/show.html"
#   end

#   # GET: /users/5/edit
#   get "/users/:id/edit" do
#     erb :"/users/edit.html"
#   end

#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/users"
#   end
# end
