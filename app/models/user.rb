class User < ActiveRecord::Base
    has_many :trackers
    has_secure_password

    validates_uniqueness_of :username
    validates_uniqueness_of :email
    validates :username, :email, :password, presence:true
end
