class User < ActiveRecord::Base
    has_many :trackers
    has_secure_password
end
