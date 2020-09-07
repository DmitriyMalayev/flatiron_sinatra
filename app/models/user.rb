class User < ActiveRecord::Base
    has_secure_password 
    validates :dev_username, presence: true, uniqueness: true 
    has_many :applications, foreign_key: "dev_id"
end




class User < ActiveRecord::Base
    has_secure_password
    validates :email, presence: true, uniqueness: true
    has_many :posts, foreign_key: "author_id"
  end


  create_table "applications", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "github_link"
    t.integer  "dev_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "dev_username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end