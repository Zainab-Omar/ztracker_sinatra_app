class User < ActiveRecord::Base
    has_many :trackers
    has_secure_password
    validates :username, :email, presence: true
    
end
