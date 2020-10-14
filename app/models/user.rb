class User < ActiveRecord::Base
    has_many :trackers
    has_secure_password
    validates :username, :email, :password, presence:true
end
