class User < ActiveRecord::Base
    has_secure_password 
    validates :dev_username, presence: true, uniqueness: true 
    has_many :applications, foreign_key: "dev_id"
end

#Tests that the user has a password, and a unique dev_username
#Shows that the user has many_applications  
#ActiveRecord assumes the foreign_key is user_id 