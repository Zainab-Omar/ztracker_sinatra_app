class User < ActiveRecord::Base
    has_many :trackers
    has_secure_password

    validates_uniqueness_of :username
    validates_uniqueness_of :email
    validates :password, presence:true
end
