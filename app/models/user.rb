class User < ActiveRecord::Base
    has_secure_password 
    validates :dev_username, presence: true, uniqueness: true 
    has_many :applications, foreign_key: "developer_id"
end