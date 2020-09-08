class ApplicationsController < ApplicationController

  get "/applications" do   #INDEX 
    @apps = Application.all 
    erb :"/applications/index.html"
  end

  get "/applications/new" do  #NEW
    redirect_if_not_logged_in
    @app = Application.new   
    erb :"/applications/new.html"
  end

  post "/applications" do   #CREATE 
    redirect_if_not_logged_in 
    @app = current_user.applications.build(title: params[:app][:title], description: params[:app][:app_description], github_link: params[:app][:github_link]) 
    
    if @app.save 
      redirect "/applications"
    else 
        erb :"applications/new.html" 
      end
    end 

  get "/applications/:id" do  #SHOW 
    set_application  
    erb :"/applications/show.html"
  end

  get "/applications/:id/edit" do  #EDIT 
    set_application
    redirect_if_not_authorized 
    erb :"/applications/edit.html"
  end

  patch "/applications/:id" do  #UPDATE  
    set_application
    redirect_if_not_authorized

    if @app.update(title: params[:app][:title], description: params[:app][:app_description], github_link: params[:app][:github_link]) 
      flash[:success] = "Application Successfully Updated"
      redirect "/applications/#{@app.id}"
    else  
      erb :"/applications/edit.html" 
    end 
  end 
 
  delete "/applications/:id" do  #DESTROY
    set_application 
    redirect_if_not_authorized
    @app.destroy   
    redirect "/applications"
  end



  private 

    def set_application
      @app = Application.find_by_id(params[:id])
      if @app.nil?
        flash[:error] = "Couldn't find an Application with this id: #{params[:id]}"
        redirect "/applications" 
      end  
    end 

    def redirect_if_not_authorized
      redirect_if_not_logged_in 
      if !authorize_application(@app)
        flash[:error] = "You don't have permission to do this action."
        redirect "/applications"
      end 
    end 

    def authorize_application(app)
      current_user == app.developer 
    end 

end