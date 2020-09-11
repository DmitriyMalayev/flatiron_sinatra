class ApplicationsController < ApplicationController

  get "/applications" do   #INDEX   Provides a list of all filled applications 
    @applications = Application.all 
    erb :"/applications/index.html"
  end

  get "/applications/new" do  #NEW   Provides form 
    redirect_if_not_logged_in
    @application = Application.new   
    erb :"/applications/new.html"
  end

  post "/applications" do   #CREATE  #Uses the above form information to build and save an app
    @application = current_user.applications.build(title: params[:application][:title], description: params[:application][:description], github_link: params[:application][:github_link]) 

    if @application.save   #goes through validations 
      redirect "/applications"
    else 
        erb :"applications/new.html" 
      end
    end 

  get "/applications/:id" do  #SHOW    #Shows a single application 
    set_application  
    erb :"/applications/show.html"
  end

  get "/applications/:id/edit" do  #EDIT    #Provides a form to edit an application 
    set_application
    redirect_if_not_authorized 
    erb :"/applications/edit.html"
  end

  patch "/applications/:id" do  #UPDATE    #updates the form  
    set_application
    redirect_if_not_authorized

    if @application.update(title: params[:app][:title], description: params[:app][:app_description], github_link: params[:app][:github_link]) 
      flash[:success] = "Application Successfully Updated"
      redirect "/applications/#{@application.id}"
    else  
      erb :"/applications/edit.html" 
    end 
  end 
 
  delete "/applications/:id" do  #DESTROY   #Destroys the form 
    set_application 
    redirect_if_not_authorized
    @application.destroy   
    redirect "/applications"
  end

  private 

    def set_application    #Finds the aookucation based on an id 
      @application = Application.find_by_id(params[:id])
      if @application.nil?
        flash[:error] = "Couldn't find an Application with this id: #{params[:id]}"
        redirect "/applications" 
      end  
    end 

    def redirect_if_not_authorized   #redirects a User if they aren't logged in 
      redirect_if_not_logged_in 
      if !authorize_application(@application)
        flash[:error] = "You don't have permission to do this action."
        redirect "/applications"
      end 
    end 

    def authorize_application(app)
      current_user == app.developer 
    end 

end



# <!-- 
#   name determine where in the params hash the value goes 
#   value where the information saves after input
  
#   name = key 
#   value = value 
# -->