class Application < ActiveRecord::Base
    belongs_to :developer, class_name: "User"
    validates :title, presence: true, uniqueness: true 
    validates :description, presence: true
    validates :github_link, format: { with: /\Ahttps:\/\/github\.com\//,   
        message: "must be a github link" } 
end