class Application < ActiveRecord::Base
    belongs_to :developer, class_name: "User"
    validates :dev_id, presence: true 
    validates :title, presence: true, uniqueness: true 
    validates :description, presence: true
    validates :github_link, presence: true #if include?("git")
end


# With a "belongs_to" macro we can specify the class name of an association. 
# IMPORTANT 
# We only use this if the name cannot be inferred from the Association Name 
# belongs_to developer will be linked by default to the Developer Class but if it's real class name is User we have to specify that with this option.  
# Now we can call developer on an application and we're going to get the User who wrote it. 
# We can now name a method how we'd like and retrieve the right object. 
