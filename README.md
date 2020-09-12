# Application Lister 

This is an app that gives a User the ability to create an account with a username and password. 

After an account has been created, a User can submit an application by providing a title, description and github link. 

There are methods in place to make sure all fields are filled out correctly. 
In regards to github, the link submitted must start with http://github  

## Installation
Make sure to fork and clone this repo 
Run bundle install
Run shotgun 
Inside of your ApplicationController class make sure to have the following inside of your configure section

set :public_folder, 'public'  
set :views, 'app/views'  
set :sessions, true 
set :session_secret, ENV["SESSION_SECRET"]
set :method_override, true  
register Sinatra::Flash

`Create a file in the root of your project called .env` 
Type in SESSION_SECRET= (in the file)
Run => generate_secret
Copy and Paste the result to Session Secret
As an example shown below. Don’t use the same code
SESSION_SECRET=3688.....

`Prevent Git Tracking` 
Open the file name .gitignore and type in .env in it
This will prevent it being tracked in git
Both files are in the root directory of your project
Make sure your .env file is NOT in Version Control

`Loading SESSION_SECRET`
We load this by using "Dotenv" gem’s "Dotenv.load" method within "config/environment.rb" (we’ll add a
conditional here to make sure this doesn’t happen if our SINATRA_ENV is production because in that case
we won’t use a hidden file, we’ll actually store the SESSION_SECRET in an environment variable running
on the server)

`Testing`
Run => `bundle exec tux` followed by `ENV[SESSION_SECRET’]`

## Usage
Visit this URL: http://localhost:9393

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)