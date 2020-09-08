class Application < ActiveRecord::Base
    belongs_to :developer, class_name: "User"
    validates :dev_id, presence: true 
    validates :title, presence: true, uniqueness: true 
    validates :description, presence: true
    validates :github_link, presence: true #if include?("git")
end
